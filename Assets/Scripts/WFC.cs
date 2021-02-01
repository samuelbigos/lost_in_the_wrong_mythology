using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WFC : MonoBehaviour
{
    public Vector3Int _islandGrid;

    enum PROT
    {
        PROT_BOT_NX_NZ,
        PROT_BOT_PX_NZ,
        PROT_BOT_PX_PZ,
        PROT_BOT_NX_PZ,
        PROT_TOP_NX_NZ,
        PROT_TOP_PX_NZ,
        PROT_TOP_PX_PZ,
        PROT_TOP_NX_PZ,
        PROT_WEIGHT,
        COUNT
    }

    public int GetPrototypeAt(int x, int y, int z)
    {
        return _final[x, y, z];
    }

    private List<PrototypeDB.ProtInternal> _prots;
    private Vector3Int _current = new Vector3Int();

    //private ushort[,,,] _cells;
    private ushort[,] _prototypes;
    private ushort[,,,] _wave;
    private int[,,] _final;
    private bool[,,] _collapsed;
    private double[,,] _entropy;
    private List<Vector3Int> _stack;

    private void Awake()
    {
    }

    public bool Step(out Vector3Int addedTile)
    {
        while (_stack.Count > 0)
        {
            Propagate();
        }
        return Collapse(out addedTile); 
    }

    void Start()
    {
        _prots = PrototypeDB.Instance.GetPrototypes();

        //_cells = new ushort[_islandGrid.x, _islandGrid.y, _islandGrid.z, (ushort)CELL.COUNT];
        _prototypes = new ushort[_prots.Count, (int)PROT.COUNT];
        _wave = new ushort[_islandGrid.x, _islandGrid.y, _islandGrid.z, _prots.Count];
        _final = new int[_islandGrid.x, _islandGrid.y, _islandGrid.z];
        _collapsed = new bool[_islandGrid.x, _islandGrid.y, _islandGrid.z];
        _entropy = new double[_islandGrid.x, _islandGrid.y, _islandGrid.z];
        _stack = new List<Vector3Int>();

        // create prototype array
        for (int i = 0; i < _prots.Count; i++)
        {
            PrototypeDB.ProtInternal prot = _prots[i];

            _prototypes[i, (ushort)PROT.PROT_BOT_NX_NZ] = (ushort)prot._cornersBot[0];
            _prototypes[i, (ushort)PROT.PROT_BOT_PX_NZ] = (ushort)prot._cornersBot[1];
            _prototypes[i, (ushort)PROT.PROT_BOT_PX_PZ] = (ushort)prot._cornersBot[2];
            _prototypes[i, (ushort)PROT.PROT_BOT_NX_PZ] = (ushort)prot._cornersBot[3];
            _prototypes[i, (ushort)PROT.PROT_TOP_NX_NZ] = (ushort)prot._cornersTop[0];
            _prototypes[i, (ushort)PROT.PROT_TOP_PX_NZ] = (ushort)prot._cornersTop[1];
            _prototypes[i, (ushort)PROT.PROT_TOP_PX_PZ] = (ushort)prot._cornersTop[2];
            _prototypes[i, (ushort)PROT.PROT_TOP_NX_PZ] = (ushort)prot._cornersTop[3];

            _prototypes[i, (ushort)PROT.PROT_WEIGHT] = 1;
        }

        // create cell arrays
        for (int x = 0; x < _islandGrid.x; x++)
        {
            for (int y = 0; y < _islandGrid.y; y++)
            {
                for (int z = 0; z < _islandGrid.z; z++)
                {
                    int count = 0;
                    for (int p = 0; p < _prots.Count; p++)
                    {
                        _wave[x, y, z, p] = 1;

                        if (y == 0) // constrain all bottom layer cells to be inside on the bottom.
                        {
                            if (_prototypes[p, (int)PROT.PROT_BOT_NX_NZ] != 1 ||
                                _prototypes[p, (int)PROT.PROT_BOT_PX_NZ] != 1 ||
                                _prototypes[p, (int)PROT.PROT_BOT_PX_PZ] != 1 ||
                                _prototypes[p, (int)PROT.PROT_BOT_NX_PZ] != 1)
                            {
                                _wave[x, y, z, p] = 0;
                            }

                            if (x == 0)
                            {
                                if (_prototypes[p, (int)PROT.PROT_TOP_NX_NZ] != 0 ||
                                    _prototypes[p, (int)PROT.PROT_TOP_NX_PZ] != 0)
                                {
                                    _wave[x, y, z, p] = 0;
                                }
                            }

                            if (x == _islandGrid.x - 1)
                            {
                                if (_prototypes[p, (int)PROT.PROT_TOP_PX_NZ] != 0 ||
                                    _prototypes[p, (int)PROT.PROT_TOP_PX_PZ] != 0)
                                {
                                    _wave[x, y, z, p] = 0;
                                }
                            }

                            if (z == 0)
                            {
                                if (_prototypes[p, (int)PROT.PROT_TOP_PX_NZ] != 0 ||
                                    _prototypes[p, (int)PROT.PROT_TOP_NX_NZ] != 0)
                                {
                                    _wave[x, y, z, p] = 0;
                                }
                            }

                            if (z == _islandGrid.z - 1)
                            {
                                if (_prototypes[p, (int)PROT.PROT_TOP_PX_PZ] != 0 ||
                                    _prototypes[p, (int)PROT.PROT_TOP_NX_PZ] != 0)
                                {
                                    _wave[x, y, z, p] = 0;
                                }
                            }
                            if (!_stack.Contains(new Vector3Int(x, y, z)))
                                _stack.Add(new Vector3Int(x, y, z));
                        }

                        if (y == _islandGrid.y - 1) // constrain all top layer cells to be empty.
                        {
                            if (_prototypes[p, (int)PROT.PROT_TOP_NX_NZ] != 0 ||
                                _prototypes[p, (int)PROT.PROT_TOP_PX_NZ] != 0 ||
                                _prototypes[p, (int)PROT.PROT_TOP_PX_PZ] != 0 ||
                                _prototypes[p, (int)PROT.PROT_TOP_NX_PZ] != 0)
                            {
                                _wave[x, y, z, p] = 0;
                                if (!_stack.Contains(new Vector3Int(x, y, z)))
                                    _stack.Add(new Vector3Int(x, y, z));
                            }
                        }

                        if (y == 0)
                        {
                            if (x > 1 && x < _islandGrid.x - 2 && z > 1 && z < _islandGrid.z - 2)
                            {
                                if (_prototypes[p, (int)PROT.PROT_TOP_NX_NZ] != 1 ||
                                    _prototypes[p, (int)PROT.PROT_TOP_PX_NZ] != 1 ||
                                    _prototypes[p, (int)PROT.PROT_TOP_PX_PZ] != 1 ||
                                    _prototypes[p, (int)PROT.PROT_TOP_NX_PZ] != 1)
                                {
                                    _wave[x, y, z, p] = 0;
                                }
                            }
                        }

                        if (y == 1)
                        {
                            if (x > 2 && x < _islandGrid.x - 3 && z > 2 && z < _islandGrid.z - 3)
                            {
                                if (_prototypes[p, (int)PROT.PROT_TOP_NX_NZ] != 1 ||
                                    _prototypes[p, (int)PROT.PROT_TOP_PX_NZ] != 1 ||
                                    _prototypes[p, (int)PROT.PROT_TOP_PX_PZ] != 1 ||
                                    _prototypes[p, (int)PROT.PROT_TOP_NX_PZ] != 1)
                                {
                                    _wave[x, y, z, p] = 0;
                                    if (!_stack.Contains(new Vector3Int(x, y, z)))
                                        _stack.Add(new Vector3Int(x, y, z));
                                }
                            }
                        }

                        if (_wave[x, y, z, p] == 1)
                        {
                            count++;
                        }
                    }

                    _entropy[x, y, z] = 99999.0;
                    _collapsed[x, y, z] = false;
                    _final[x, y, z] = -1;
                }
            }
        }

        _entropy[0, 0, 0] = 1.0;
        Random.InitState(System.DateTime.UtcNow.Millisecond);
    }

    ushort BuildSlot(int c1, int c2, int c3, int c4)
    {
        ushort slot = 0;
        slot = (ushort)(slot | (((ushort)c1 & 0xF) << 0));
        slot = (ushort)(slot | (((ushort)c2 & 0xF) << 4));
        slot = (ushort)(slot | (((ushort)c3 & 0xF) << 8));
        slot = (ushort)(slot | (((ushort)c4 & 0xF) << 12));
        return slot;
    }

    void Propagate()
    {
        Vector3Int s_cell = _stack[_stack.Count - 1];
        _stack.RemoveAt(_stack.Count - 1);

        // for each of the 6 neighboring cells...
        for (int n = 0; n < 6; n++)
        {
            Vector3Int n_cell = new Vector3Int();
            bool found = false;

            // get the location of the neighbor.
            switch(n)
            {
                case 0:
                    if (s_cell.x > 0)
                    {
                        n_cell = new Vector3Int(s_cell.x - 1, s_cell.y, s_cell.z);
                        found = true;
                    }
                    break;
                case 1:
                    if (s_cell.y > 0)
                    {
                        n_cell = new Vector3Int(s_cell.x, s_cell.y - 1, s_cell.z);
                        found = true;
                    }
                    break;
                case 2:
                    if (s_cell.x < _islandGrid.x - 1)
                    {
                        n_cell = new Vector3Int(s_cell.x + 1, s_cell.y, s_cell.z);
                        found = true;
                    }
                    break;
                case 3:
                    if (s_cell.y < _islandGrid.y - 1)
                    {
                        n_cell = new Vector3Int(s_cell.x, s_cell.y + 1, s_cell.z);
                        found = true;
                    }
                    break;
                case 4:
                    if (s_cell.z > 0)
                    {
                        n_cell = new Vector3Int(s_cell.x, s_cell.y, s_cell.z - 1);
                        found = true;
                    }
                    break;
                case 5:
                    if (s_cell.z < _islandGrid.z - 1)
                    {
                        n_cell = new Vector3Int(s_cell.x, s_cell.y, s_cell.z + 1);
                        found = true;
                    }
                    break;
                default:
                    break;
            }

            if (!found)
                continue;

            List<ushort> incompatible = new List<ushort>();

            // for each still possible prototype in the neighboring cell...
            for (ushort nt = 0; nt < _prots.Count; nt++)
            {
                if (_wave[n_cell.x, n_cell.y, n_cell.z, nt] == 0)
                    continue;

                bool compatible = false;
                // check that prototype against all possible prototypes in the stack cell...
                for (ushort st = 0; st < _prots.Count; st++)
                {
                    if (_wave[s_cell.x, s_cell.y, s_cell.z, st] == 0)
                        continue;

                    if (n_cell.z < s_cell.z)
                    {
                        compatible = _prototypes[nt, (ushort)PROT.PROT_TOP_PX_PZ] == _prototypes[st, (ushort)PROT.PROT_TOP_PX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_TOP_NX_PZ] == _prototypes[st, (ushort)PROT.PROT_TOP_NX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_PX_PZ] == _prototypes[st, (ushort)PROT.PROT_BOT_PX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_NX_PZ] == _prototypes[st, (ushort)PROT.PROT_BOT_NX_NZ];
                    }
                    else if(n_cell.z > s_cell.z)
                    {
                        compatible = _prototypes[nt, (ushort)PROT.PROT_TOP_PX_NZ] == _prototypes[st, (ushort)PROT.PROT_TOP_PX_PZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_TOP_NX_NZ] == _prototypes[st, (ushort)PROT.PROT_TOP_NX_PZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_PX_NZ] == _prototypes[st, (ushort)PROT.PROT_BOT_PX_PZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_NX_NZ] == _prototypes[st, (ushort)PROT.PROT_BOT_NX_PZ];
                    }
                    else if (n_cell.x < s_cell.x)
                    {
                        compatible = _prototypes[nt, (ushort)PROT.PROT_TOP_PX_NZ] == _prototypes[st, (ushort)PROT.PROT_TOP_NX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_TOP_PX_PZ] == _prototypes[st, (ushort)PROT.PROT_TOP_NX_PZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_PX_NZ] == _prototypes[st, (ushort)PROT.PROT_BOT_NX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_PX_PZ] == _prototypes[st, (ushort)PROT.PROT_BOT_NX_PZ];
                    }
                    else if (n_cell.x > s_cell.x)
                    {
                        compatible = _prototypes[nt, (ushort)PROT.PROT_TOP_NX_NZ] == _prototypes[st, (ushort)PROT.PROT_TOP_PX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_TOP_NX_PZ] == _prototypes[st, (ushort)PROT.PROT_TOP_PX_PZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_NX_NZ] == _prototypes[st, (ushort)PROT.PROT_BOT_PX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_NX_PZ] == _prototypes[st, (ushort)PROT.PROT_BOT_PX_PZ];
                    }
                    else if (n_cell.y < s_cell.y)
                    {
                        compatible = _prototypes[nt, (ushort)PROT.PROT_TOP_NX_NZ] == _prototypes[st, (ushort)PROT.PROT_BOT_NX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_TOP_PX_NZ] == _prototypes[st, (ushort)PROT.PROT_BOT_PX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_TOP_PX_PZ] == _prototypes[st, (ushort)PROT.PROT_BOT_PX_PZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_TOP_NX_PZ] == _prototypes[st, (ushort)PROT.PROT_BOT_NX_PZ];
                    }
                    else if (n_cell.y > s_cell.y)
                    {
                        compatible = _prototypes[nt, (ushort)PROT.PROT_BOT_NX_NZ] == _prototypes[st, (ushort)PROT.PROT_TOP_NX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_PX_NZ] == _prototypes[st, (ushort)PROT.PROT_TOP_PX_NZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_PX_PZ] == _prototypes[st, (ushort)PROT.PROT_TOP_PX_PZ] &&
                                    _prototypes[nt, (ushort)PROT.PROT_BOT_NX_PZ] == _prototypes[st, (ushort)PROT.PROT_TOP_NX_PZ];
                    }

                    if (compatible)
                        break;
                }

                if (!compatible)
                    incompatible.Add(nt);
            }
            if (incompatible.Count > 0)
            {
                for (int i = 0; i < incompatible.Count; i++)
                {
                    Ban(n_cell, incompatible[i]);
                }

                _entropy[n_cell.x, n_cell.y, n_cell.z] = CalcEntropy(n_cell);
                _stack.Add(n_cell);
            }
        }
    }

    void Ban(Vector3Int cell, ushort prototype)
    {
        _wave[cell.x, cell.y, cell.z, prototype] = 0;
    }

    bool Collapse(out Vector3Int addedTile)
    {
        addedTile = new Vector3Int();

        if (!Observe(out _current))
            return true;

        double sumOfWeights = 0.0;
        for (int i = 0; i < _prots.Count; i++)
        {
            if (_wave[_current.x, _current.y, _current.z, i] == 0)
                continue;

            sumOfWeights += 1.0;
        }

        if (sumOfWeights < 0.00001)
        {
            _collapsed[_current.x, _current.y, _current.z] = true;
            return true;
        }

        int randTile = -1;
        double rng = (double)Random.Range(0.0f, 1.0f);
        double rnd = rng * sumOfWeights;
        for (int i = 0; i < _prots.Count; i++)
        {
            if (_wave[_current.x, _current.y, _current.z, i] == 0)
                continue;

            if (rnd < 1.0)
            {
                randTile = i;
                break;
            }
            rnd -= (double)1.0;
        }

        if (randTile == -1)
        {
            return true;
        }

        for (int i = 0; i < _prots.Count; i++)
        {
            _wave[_current.x, _current.y, _current.z, i] = 0;
        }
        _wave[_current.x, _current.y, _current.z, randTile] = 1;
        _collapsed[_current.x, _current.y, _current.z] = true;
        _final[_current.x, _current.y, _current.z] = (ushort)randTile;
        _stack.Add(_current);
        addedTile = _current;

        return false;
    }

    double CalcEntropy(Vector3Int cell)
    {
        return Vector3Int.Distance(cell, new Vector3Int(0, 0, 0));
    }

    bool Observe(out Vector3Int cell)
    {
        bool found = false;
        double lowest_entropy = 9999999.9;
        cell = new Vector3Int();
        for (int x = 0; x < _islandGrid.x; x++)
        {
            for (int y = 0; y < _islandGrid.y; y++)
            {
                for (int z = 0; z < _islandGrid.z; z++)
                {
                    if (_collapsed[x, y, z])
                        continue;

                    if (_entropy[x, y, z] == 0.0)
                    {
                        cell = new Vector3Int(x, y, z);
                        found = true;
                        break;
                    }
                    if (_entropy[x, y, z] < lowest_entropy)
                    {
                        lowest_entropy = _entropy[x, y, z];
                        cell = new Vector3Int(x, y, z);
                        found = true;
                    }
                }
                if (found)
                    break;
            }
            if (found)
                break;
        }
        return found;
    }
}
