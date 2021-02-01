using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MapGenerator : MonoBehaviour
{
    public Vector2Int Quadrants = new Vector2Int();
    public float QuadrantSize = 100.0f;
    public int GenerateQuadrantDistance = 1;
    public Vector2Int StartingQuadrant;
    public float QuadrantPadding = 0.1f;
    public int NumScrolls = 3;
    public float FinaleCollapseTimer = 5.0f;

    public UIManager UIManagerRef;
    public GameObject IslandPrefab;
    public GameObject SeaPrefab;
    public Player Player;
    public Boat Boat;
    public GameObject PlayerCamera;
    public GameObject FinaleIslandPrefab;
    public CharonBoss CharonPrefab;
    public GameObject Lantern;

    public Vector3 CentreOfMap;

    Dictionary<Vector2Int, Island> _quadrantIslands = new Dictionary<Vector2Int, Island>();
    Vector2Int _currentQuadrant;
    List<Vector2Int> _scrollQuadrants = new List<Vector2Int>();
    bool _finaleCollapse = false;
    CharonBoss _charon = null;

    void Awake()
    {
        _scrollQuadrants = new List<Vector2Int>();
        int maxLoops = 999;
        while (_scrollQuadrants.Count < NumScrolls)
        {
            maxLoops--;
            if (maxLoops <= 0)
                break;

            Vector2Int potentialScrollLoc = new Vector2Int(Random.Range(0, Quadrants.x), Random.Range(0, Quadrants.y));
            if (_scrollQuadrants.Contains(potentialScrollLoc))
                continue;

            // don't spawn scrolls near the middle
            if (Mathf.Abs(potentialScrollLoc.x - StartingQuadrant.x) < 2 || Mathf.Abs(potentialScrollLoc.y - StartingQuadrant.y) < 2)
                continue;

            _scrollQuadrants.Add(potentialScrollLoc);
        }
    }

    void Start()
    {
        Random.InitState(System.DateTime.UtcNow.Millisecond);

        // populate quadrants from our starting location.
        PopulateQuadrantsFrom(StartingQuadrant);

        Vector3 camOffset = PlayerCamera.transform.position - Player.transform.position;
        Vector2Int boatStartPos = StartingQuadrant; // + new Vector2Int(0, -2);
        Vector3 before = Boat.transform.position;
        Boat.transform.position = new Vector3((boatStartPos.x) * QuadrantSize + QuadrantSize * 0.5f, 
                                                Player.transform.position.y, 
                                                (boatStartPos.y) * QuadrantSize + QuadrantSize * 0.5f);
        PlayerCamera.transform.position = Player.transform.position + camOffset;
        Vector3 offset = Boat.transform.position - before;
        Lantern.transform.position -= offset;

        CentreOfMap = new Vector3((StartingQuadrant.x) * QuadrantSize + QuadrantSize * 0.5f,
                                    0.0f,
                                    (StartingQuadrant.y) * QuadrantSize + QuadrantSize * 0.5f);

        _currentQuadrant = new Vector2Int((int)(Player.transform.position.x / QuadrantSize),
                                          (int)(Player.transform.position.z / QuadrantSize));
    }

    public void MoveBoatToQuadrant()
    {
        Vector2Int boatStartPos = StartingQuadrant + new Vector2Int(0, -2);
        Boat.transform.position = new Vector3((boatStartPos.x) * QuadrantSize + QuadrantSize * 0.5f,
                                                Player.transform.position.y,
                                                (boatStartPos.y) * QuadrantSize + QuadrantSize * 0.5f);

        Boat.UpdatePlayerPos();
    }

    void Update()
    {
        // check if we need to add more quadrants due to player movements.
        Vector2Int currentQuadrant = new Vector2Int((int)(Player.transform.position.x / QuadrantSize),
                                                    (int)(Player.transform.position.z / QuadrantSize));

        if (currentQuadrant != _currentQuadrant)
        {
            OnEnterQuadrant(currentQuadrant);
        }

        _currentQuadrant = currentQuadrant;

        if (_finaleCollapse)
        {
            FinaleCollapseTimer -= Time.deltaTime;

            Vector3 shakeOffset = new Vector3();
            shakeOffset.x = Mathf.Sin(FinaleCollapseTimer * 55.0f) * 0.075f;
            shakeOffset.y = Mathf.Sin(FinaleCollapseTimer * 40.0f) * 0.1f;
            shakeOffset.z = Mathf.Sin(FinaleCollapseTimer * 60.0f) * 0.125f;
            Player.CameraShakeOffset = shakeOffset;

            if (FinaleCollapseTimer < 0.0f)
            {
                Player.CameraShakeOffset = Vector3.zero;
                _finaleCollapse = false;
            }
        }
    }

    public void TriggerFinale()
    {
        foreach (Vector2Int quadrant in _quadrantIslands.Keys)
        {
            Island island = _quadrantIslands[quadrant];
            if (island)
            {
                island.TriggerCollapse();
            }
        }

        // create the portal to elysium
        Vector2Int quadrantCoord = StartingQuadrant;
        Vector2 boundBot = new Vector2((quadrantCoord.x + QuadrantPadding) * QuadrantSize, (quadrantCoord.y + QuadrantPadding) * QuadrantSize);
        Vector2 boundTop = new Vector2((quadrantCoord.x + 1.0f - QuadrantPadding) * QuadrantSize, (quadrantCoord.y + 1.0f - QuadrantPadding) * QuadrantSize);
        Vector3 islandPos = new Vector2((boundBot.x + boundTop.x) * 0.5f, (boundBot.y + boundTop.y) * 0.5f);

        GameObject finaleIsland = Instantiate(FinaleIslandPrefab, new Vector3(islandPos.x, 0.0f, islandPos.y), Quaternion.identity);
        Vector3 facing = Player.transform.position - islandPos;
        facing.y = 0.0f;
        finaleIsland.transform.forward = -facing;

        // spawn charon
        Vector3 spawnLoc = CentreOfMap + (Player.transform.position - CentreOfMap).normalized * 40.0f;
        _charon = Instantiate(CharonPrefab, spawnLoc, Quaternion.identity);
        _charon.transform.forward = -facing;
        _charon.PlayerRef = Player;
        _charon.UIRef = UIManagerRef;

        _finaleCollapse = true;
        Player.OnFinale = true;
    }

    void PopulateQuadrantsFrom(Vector2Int quadrantCoord)
    {
        for (int x = quadrantCoord.x - GenerateQuadrantDistance; x <= quadrantCoord.x + GenerateQuadrantDistance; x++)
        {
            for (int y = quadrantCoord.y - GenerateQuadrantDistance; y <= quadrantCoord.y + GenerateQuadrantDistance; y++)
            {
                GenerateQuadrant(new Vector2Int(x, y));
            }
        }
    }

    void GenerateQuadrant(Vector2Int quadrantCoord)
    {
        if (_quadrantIslands.ContainsKey(quadrantCoord)) 
            return;

        if (quadrantCoord.x < 0 || quadrantCoord.y < 0)
            return;

        if (quadrantCoord.x >= Quadrants.x || quadrantCoord.y >= Quadrants.y)
            return;

        // create the island that goes in the quadrant.
        Vector2 boundBot = new Vector2((quadrantCoord.x + QuadrantPadding) * QuadrantSize, (quadrantCoord.y + QuadrantPadding) * QuadrantSize);
        Vector2 boundTop = new Vector2((quadrantCoord.x + 1.0f - QuadrantPadding) * QuadrantSize, (quadrantCoord.y + 1.0f - QuadrantPadding) * QuadrantSize);
        Vector3 islandPos = new Vector2(Random.Range(boundBot.x, boundTop.x), Random.Range(boundBot.y, boundTop.y));

        Island island = null;
        if (quadrantCoord != StartingQuadrant) // don't put an island on starting quadrant.
        {
            island = Instantiate(IslandPrefab, new Vector3(islandPos.x, 0.0f, islandPos.y), Quaternion.identity).GetComponent<Island>();
            if (_scrollQuadrants.Contains(quadrantCoord))
            {
                island.HasScroll = true;
            }
            else
            {
                island.HasElixir = true;
            }            
            
            Boat.OnIslandAdded(island);
        }

        Vector3 seaPos = (boundBot + boundTop) * 0.5f;
        GameObject sea = Instantiate(SeaPrefab, new Vector3(seaPos.x, 1.0f, seaPos.y), Quaternion.identity);
        sea.transform.localScale = new Vector3(QuadrantSize, QuadrantSize, QuadrantSize) * 0.1f;

        _quadrantIslands.Add(quadrantCoord, island);
    }

    void OnEnterQuadrant(Vector2Int quadrantCoord)
    {
        PopulateQuadrantsFrom(quadrantCoord);
    }
}
