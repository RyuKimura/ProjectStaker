using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyAi : MonoBehaviour {

    public Transform goal;


    //public List<NetworkPlayer> listOfPlayers = new List<NetworkPlayer>();

    public GameObject player;

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
        //Debug.Log(listOfPlayers);
       // int temp = Random.Range(0, listOfPlayers.Count);
        return player.transform;//listOfPlayers[temp];
    }
}
