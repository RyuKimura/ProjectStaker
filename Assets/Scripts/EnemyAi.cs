using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyAi : MonoBehaviour {

    //public List<NetworkPlayer> listOfPlayers = new List<NetworkPlayer>();

    public GameObject player;

    private Vector3 prevPlayerLoc;
    NavMeshAgent agent;
    // Use this for initialization
    void Start () {
        agent = GetComponent<NavMeshAgent>();
        prevPlayerLoc = getPlayer();
        agent.destination = prevPlayerLoc;
	}
	
	// Update is called once per frame
	void Update () {
        if(Vector3.SqrMagnitude(getPlayer() - prevPlayerLoc) > 1)
        {
            agent.destination = getPlayer();
            prevPlayerLoc = getPlayer();
        }
    }

    Vector3 getPlayer()
    {
        //Debug.Log(listOfPlayers);
       // int temp = Random.Range(0, listOfPlayers.Count);
        return player.transform.position;//listOfPlayers[temp];
    }
}
