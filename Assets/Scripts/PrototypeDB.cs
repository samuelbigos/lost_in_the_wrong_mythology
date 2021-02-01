using System;
using System.Xml;
using System.Collections.Generic;
using UnityEngine;
using System.IO;

public class PrototypeDB : MonoBehaviour
{
	public class ProtInternal
    {
		public GameObject[] _meshes;
		public int[] _meshRotations;
		public int[] _rotations;
		public int[] _cornersBot;
		public int[] _cornersTop;
		public int Rot;
	}

    public static PrototypeDB Instance;

    [SerializeField]
    public Prototype[] _prototypes;

	List<ProtInternal> newPrototypes = new List<ProtInternal>();

	public List<ProtInternal> GetPrototypes() { return newPrototypes; }

    private void Awake()
    {
        Instance = this;

		newPrototypes = new List<ProtInternal>();

		for (int p = 0; p < _prototypes.Length; p++)
        {
			foreach (int r in _prototypes[p]._rotations)
            {
				ProtInternal newProt = new ProtInternal();

				newProt._meshes = (GameObject[])_prototypes[p]._meshes.Clone();
				newProt._meshRotations = (int[])_prototypes[p]._meshRotations.Clone();
				newProt.Rot = r;
				newProt._cornersBot = new int[4];
				newProt._cornersBot[0] = (_prototypes[p]._cornersBot[(0 + r) % 4]);
				newProt._cornersBot[1] = (_prototypes[p]._cornersBot[(1 + r) % 4]);
				newProt._cornersBot[2] = (_prototypes[p]._cornersBot[(2 + r) % 4]);
				newProt._cornersBot[3] = (_prototypes[p]._cornersBot[(3 + r) % 4]);
				newProt._cornersTop = new int[4];
				newProt._cornersTop[0] = (_prototypes[p]._cornersTop[(0 + r) % 4]);
				newProt._cornersTop[1] = (_prototypes[p]._cornersTop[(1 + r) % 4]);
				newProt._cornersTop[2] = (_prototypes[p]._cornersTop[(2 + r) % 4]);
				newProt._cornersTop[3] = (_prototypes[p]._cornersTop[(3 + r) % 4]);

				newPrototypes.Add(newProt);
			}
		}
    }
}