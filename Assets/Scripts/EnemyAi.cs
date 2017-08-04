using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public enum EnemyState
{
    NONE,
    CHASE,
    WAIT,
    RUN,
    ATTACK
}

public class EnemyAi : MonoBehaviour {

    //public List<NetworkPlayer> listOfPlayers = new List<NetworkPlayer>();
    public float braveryMeter;
    public GameObject player;
    [Tooltip("In Seconds")]
    public float attackCoolDown;
    public float attackRadius;
    [Space(10)]

    [Header("State Thresholds")]
    public float chaseThreshold;
    //public float waitThreshold;
    public float attackThreshold;

    EnemyState CurrentState;
    NavMeshAgent agent;
    float speed;
    float currentSpeed;
    float currentCooldown;
    playerMovement playerScript;
    void Start () {
        agent = GetComponent<NavMeshAgent>();
        CurrentState = EnemyState.CHASE;
        playerScript = player.GetComponent<playerMovement>();
        speed = agent.speed;
        currentCooldown = attackCoolDown;
	}
	
	void Update () {
        braveryMeter++;

        if (currentCooldown < attackCoolDown) currentCooldown += Time.deltaTime;

        var lookPos = getPlayerPosition() - transform.position;
        lookPos.y = 0;
        var rotation = Quaternion.LookRotation(lookPos);
        transform.rotation = Quaternion.LerpUnclamped(transform.rotation, rotation, 0.1f);

        StateCheck();
    }


    float getPlayerLightRadius()
    {
        return playerScript.currentLightRadius;
    }

    bool getPlayerSwingState()
    {
        return playerScript.swingingTorch;
    }

    Vector3 getPlayerPosition()
    {
        return player.transform.position;
    }

    float getDistancetoPlayer()
    {
        return Vector3.Distance(transform.position, getPlayerPosition());
    }

    float getNextDistancetoPlayer()
    {
        return Vector3.Distance(agent.nextPosition , getPlayerPosition());
    }
    
    bool TooCloseToPlayer()
    {
        return getDistancetoPlayer() < getPlayerLightRadius();
    }

    bool WillBeTooCloseToPlayer()
    {
        return getNextDistancetoPlayer() + 1 < getPlayerLightRadius();
    }


    void StateCheck()
    {
        if(TooCloseToPlayer() && playerScript.swingingTorch && !playerScript.successfullySwung)
        {
            braveryMeter -= playerScript.lightEffectiveness;
            playerScript.lightEffectiveness -= playerScript.lightDecreaseEffect;
            playerScript.successfullySwung = true;
        }

        if (!playerScript.torchIsLit || !playerScript.hasTorch) braveryMeter = attackThreshold;

        if (braveryMeter <= chaseThreshold && CurrentState != EnemyState.CHASE)
        {
            CurrentState = EnemyState.CHASE;
        }
        else if (braveryMeter >= attackThreshold && CurrentState != EnemyState.ATTACK)
        {
            CurrentState = EnemyState.ATTACK;
        }

        if (CurrentState != EnemyState.ATTACK)
        {
            if (TooCloseToPlayer() && WillBeTooCloseToPlayer())
            {
                RunState();
            }
            else if (!TooCloseToPlayer() && WillBeTooCloseToPlayer())
            {
                WaitState();
            }
            else if (!TooCloseToPlayer() && !WillBeTooCloseToPlayer())
            {
                ChaseState();
            }
        }
        else
        {
            AttackState();
        }
    }

    void ChaseState()
    {
        CurrentState = EnemyState.CHASE;
        currentSpeed = speed;
        agent.destination = getPlayerPosition();
    }

    void WaitState()
    {
        CurrentState = EnemyState.WAIT;
        currentSpeed = 0;
    }

    void RunState()
    {
        CurrentState = EnemyState.RUN;
        agent.nextPosition =  transform.position - transform.forward * 0.1f;
        //agent.Move(-transform.forward * 0.1f);
    }

    void AttackState()
    {
        if(getDistancetoPlayer() > attackRadius * attackRadius)
        {
            agent.Move(transform.forward * 0.2f);
        }
        else
        {
            if (currentCooldown >= attackCoolDown)
            {
                CurrentState = EnemyState.ATTACK;
                playerScript.lives--;
                currentCooldown = 0;
            }
        }
    }
}
