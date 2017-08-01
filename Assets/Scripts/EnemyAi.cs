using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyAi : MonoBehaviour {

    public Transform goal;


    GameObject[] listOfPlayers;
	// Use this for initialization
	void Start () {
        NavMeshAgent agent = GetComponent<NavMeshAgent>();
        agent.destination = getPlayer().position;
	}
	
	// Update is called once per frame
	void Update () {
        
	}

    Transform getPlayer()
    {
        listOfPlayers = GameObject.FindGameObjectsWithTag("Player");
        Debug.Log(listOfPlayers);
        int temp = Random.Range(0, listOfPlayers.Length);
        return listOfPlayers[temp].transform;
    }
}
