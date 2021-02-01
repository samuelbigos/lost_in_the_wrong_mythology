using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Island : MonoBehaviour
{
    public Vector3 GridSize = new Vector3(1.0f, 1.0f, 1.0f);
    public Vector3Int IslandSizeMin;
    public Vector3Int IslandSizeMax;
    public float IslandDepth = 1.0f;
    public int TilesPerFrame = 1;
    public GameObject SkullElixirPrefab;
    public GameObject ScrollPrefab;
    public float CollapseSpeed = 1.0f;

    private float _gridSpacing = 2.0f;
    private WFC _wfc;
    private bool _generated = false;
    private bool _collapsing = false;

    Vector3 _highestVoxel = new Vector3();

    public bool HasScroll = false;
    public bool HasElixir = false;

    GameObject _item;

    public bool ItemPicked { get { return _item == null; } }

    private void Awake()
    {
        _wfc = GetComponent<WFC>();
        _wfc._islandGrid.x = Random.Range(IslandSizeMin.x, IslandSizeMax.x);
        _wfc._islandGrid.y = Random.Range(IslandSizeMin.y, IslandSizeMax.y);
        _wfc._islandGrid.z = Random.Range(IslandSizeMin.z, IslandSizeMax.z);
    }
    void Start()
    {
    }

    public void TriggerCollapse()
    {
        if (_item)
            Destroy(_item);
        _collapsing = true;
    }

    void Update()
    {
        if (_collapsing)
        {
            Vector3 pos = transform.position;
            pos.y -= CollapseSpeed * Time.deltaTime;
            transform.position = pos;

            if (transform.position.y < -(_wfc._islandGrid.y * _gridSpacing * GridSize.y))
            {
                _collapsing = false;
                Destroy(_item);
            }
        }

        if (!_generated)
        {
            List<PrototypeDB.ProtInternal> _prots = PrototypeDB.Instance.GetPrototypes();

            int tiles = 0;
            while (tiles < TilesPerFrame)
            {
                Vector3Int addedTile = new Vector3Int();
                bool result = _wfc.Step(out addedTile);

                int prototype = _wfc.GetPrototypeAt(addedTile.x, addedTile.y, addedTile.z);
                for (int i = 0; i < _prots[prototype]._meshes.Length; i++)
                {
                    float s = _gridSpacing;
                    Vector3 pos = new Vector3(addedTile.x * s * GridSize.x, addedTile.y * s * GridSize.y - IslandDepth, addedTile.z * s * GridSize.z);
                    pos.x -= _wfc._islandGrid.x * 0.5f * s * GridSize.x;
                    pos.z -= _wfc._islandGrid.z * 0.5f * s * GridSize.z;
                    Quaternion rot = Quaternion.Euler(new Vector3(0.0f, (_prots[prototype].Rot + _prots[prototype]._meshRotations[i] + 1) * 90.0f, 0.0f));
                    GameObject tile = Instantiate(_prots[prototype]._meshes[i], pos, rot);

                    Vector3 tempPos = tile.transform.localPosition;
                    tile.transform.parent = this.transform;
                    tile.transform.localPosition = tempPos;
                    tile.transform.localScale = GridSize;

                    for (int v = 0; v < 4; v++)
                    {
                        bool voxel = _prots[prototype]._cornersTop[v] == 1;
                        if (voxel)
                        {
                            Vector3 voxelPos = pos;
                            switch (v)
                            {
                                case 0:
                                    voxelPos += new Vector3(-s * 0.5f * GridSize.x, s * 0.5f * GridSize.y, -s * 0.5f * GridSize.z);
                                    break;
                                case 1:
                                    voxelPos += new Vector3(s * 0.5f * GridSize.x, s * 0.5f * GridSize.y, -s * 0.5f * GridSize.z);
                                    break;
                                case 2:
                                    voxelPos += new Vector3(s * 0.5f * GridSize.x, s * 0.5f * GridSize.y, s * 0.5f * GridSize.z);
                                    break;
                                case 3:
                                    voxelPos += new Vector3(-s * 0.5f * GridSize.x, s * 0.5f * GridSize.y, s * 0.5f * GridSize.z);
                                    break;
                                default:
                                    break;

                            }
                            if (voxelPos.y > _highestVoxel.y)
                            {
                                _highestVoxel = voxelPos;
                            }
                        }
                    }
                }
                tiles += 1;

                if (result)
                {
                    _generated = true;
                    break;
                }
            }

            if (_generated)
            {
                // generation has finished so spawn an elixir at the highest point on the island.
                Vector3 offset = new Vector3(0.0f, _gridSpacing * GridSize.y, 0.0f);
                if (HasElixir)
                {
                    _item = Instantiate(SkullElixirPrefab, _highestVoxel + offset, Quaternion.identity);
                    Vector3 tempPos = _item.transform.localPosition;
                    _item.transform.parent = this.transform;
                    _item.transform.localPosition = tempPos;
                }
                else if(HasScroll)
                {
                    _item = Instantiate(ScrollPrefab, _highestVoxel + offset, Quaternion.identity);
                    Vector3 tempPos = _item.transform.localPosition;
                    _item.transform.parent = this.transform;
                    _item.transform.localPosition = tempPos;
                }
            }
        }
    }
}
