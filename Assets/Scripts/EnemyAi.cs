using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public enum EnemyState
{
    NONE,
    CHASE,
    WAIT,
    ATTACK
}

public class EnemyAi : MonoBehaviour {

    //public List<NetworkPlayer> listOfPlayers = new List<NetworkPlayer>();
    [Range(0,100)]
    public float braveryMeter;
    public GameObject player;
    [Space(10)]

    [Header("State Thresholds")]
    public float chaseThreshold;
    //public float waitThreshold;
    public float attackThreshold;

    EnemyState CurrentState;
    NavMeshAgent agent;
    Vector3 prevPlayerLoc;
    float playerLightRadius; 
    void Start () {
        agent = GetComponent<NavMeshAgent>();
        prevPlayerLoc = getPlayer();
        CurrentState = EnemyState.CHASE;
        playerLightRadius = player.GetComponent<playerMovement>().lightRadius;
	}
	
	void Update () {
        if (braveryMeter <= chaseThreshold)
        {
            ChaseState();
        }
        else if (braveryMeter > chaseThreshold && braveryMeter < attackThreshold)
        {
            AttackState();
        }
        else if(braveryMeter >= attackThreshold)
        {
            AttackState();
        }
    }






    Vector3 getPlayer()
    {
        return player.transform.position;
    }

    float getDistancetoPlayer()
    {
        return Vector3.SqrMagnitude(transform.position - getPlayer());
    }

    float getInverseAngleToPlayer()
    {
        return Vector3.Angle(transform.position, player.transform.position);
    }


    void ChaseState()
    {
        if (getDistancetoPlayer() < playerLightRadius * playerLightRadius)
        {
            RunState();
        }
        

        if (Vector3.SqrMagnitude(getPlayer() - prevPlayerLoc) > 1)
        {
            agent.destination = getPlayer();
            prevPlayerLoc = getPlayer();
        }
    }

    void RunState()
    {
        agent.Move(-Vector3.forward * 0.1f);
    }

    void AttackState()
    {
        Debug.Log("ATTACKIING");
    }
}
