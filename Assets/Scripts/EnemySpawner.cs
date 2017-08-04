using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Networking;

public enum SpawnType
{
    None,
    Timer,
    Trigger
}

public class EnemySpawner : MonoBehaviour
{
    public SpawnType SpawnMethod;

    [Space(10)]
    [Header("Prefabs")]
    public GameObject enemyPrefab;
    public GameObject aiGoal;
    public GameObject[] TriggerBoxes;
    [Space(10)]

    [Header("Variables")]
    public float timer;
    public int enemyCount;
    public float DestroyTimer;
    
    int currEnemyCount = 0;
    float currTimer;
    private float lightRadii;

    private void Start()
    {
        lightRadii = aiGoal.GetComponent<playerMovement>().lightRadius;
        currTimer = timer;

        for(int i = 0; i < TriggerBoxes.Length; i++)
        {
            TriggerBoxes[i].GetComponent<TriggerBoxScript>().parent.Add(gameObject);
        }

    }
    //List<NetworkPlayer> playerList = new List<NetworkPlayer>();
    //public int playerCount;

    private void Update()
    {
        if((int)SpawnMethod == (int)SpawnType.Timer)
        {
            TimerMethod();
        }
        var lookPos = aiGoal.transform.position - transform.position;
        lookPos.y = 0;
        var rotation = Quaternion.LookRotation(lookPos);
        transform.rotation = Quaternion.LerpUnclamped(transform.rotation, rotation, 0.1f);

        if(aiGoal.GetComponent<playerMovement>().hasTorch && getDist() < aiGoal.GetComponent<playerMovement>().currentLightRadius)
        {
            Destroy(gameObject,DestroyTimer);
        }
    }

    void TimerMethod()
    {
        if (currTimer > 0)
        {
            currTimer -= Time.deltaTime;
        }
        else if (currTimer <= 0 && currEnemyCount < enemyCount && getDist() > lightRadii)
        {
            SpawnEnemy();
        }
    }

    public void SpawnEnemy()
    {
        Vector3 pos = transform.position;
        GameObject temp = Instantiate(enemyPrefab, new Vector3(pos.x, pos.y + (enemyPrefab.GetComponent<CapsuleCollider>().height / 2), pos.z), Quaternion.identity);
        temp.GetComponent<EnemyAi>().player = aiGoal;
        currEnemyCount++;
        currTimer = timer;
    }

    float getDist()
    {
        return Vector3.Distance(transform.position, aiGoal.transform.position);
    }

    public void triggerActivate()
    {
        SpawnMethod = SpawnType.Timer;
        for (int i = 0; i < TriggerBoxes.Length; i++)
        {
            TriggerBoxes[i].GetComponent<TriggerBoxScript>().alreadyActivated = true;
        }
    }
}









//    private void OnPlayerConnected(NetworkPlayer player)
//    {
        
//        playerList.Add(player);
//        ++playerCount;
//        if (playerCount == 1)
//        {
//            SpawnEnemy();
//        }
//    }

//    void SpawnEnemy()
//    {
//        Vector3 pos;
//        if (RandomPoint(transform.position, 10.0f, out pos))
//        {
//            GameObject temp = Instantiate(enemyPrefab, new Vector3(pos.x, pos.y + (enemyPrefab.GetComponent<CapsuleCollider>().height / 2), pos.z), Quaternion.identity);
//            //temp.GetComponent<EnemyAi>().listOfPlayers = playerList;
//            //NetworkServer.Spawn(temp);
//        }
//    }

//    //bool RandomPoint(Vector3 center, float range, out Vector3 result)
//    //{
//    //    for (int i = 0; i < 30; i++)
//    //    {
//    //        Vector3 randomPoint = center + Random.insideUnitSphere * range;
//    //        NavMeshHit hit;
//    //        if (NavMesh.SamplePosition(randomPoint, out hit, 1.0f, NavMesh.AllAreas))
//    //        {
//    //            result = hit.position;
//    //            return true;
//    //        }
//    //    }
//    //    result = Vector3.zero;
//    //    return false;
//    //}
//}
