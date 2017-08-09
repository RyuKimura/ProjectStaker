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
    public float DestroyTimer;
    
    float currTimer;
    private float lightRadii;
    bool dead = false;
    bool spawned = false;
    ParticleSystem deathFlame;
    ParticleSystem spawnsmoke;
    playerMovement player;

    private void Start()
    {
        deathFlame = transform.Find("deathflame").GetComponent<ParticleSystem>();
        spawnsmoke = transform.Find("spawnsmoke").GetComponent<ParticleSystem>();
        player = aiGoal.GetComponent<playerMovement>();
        lightRadii = player.lightRadius;
        currTimer = timer;
        deathFlame.Stop();

        for(int i = 0; i < TriggerBoxes.Length; i++)
        {
            TriggerBoxes[i].GetComponent<TriggerBoxScript>().parent.Add(gameObject);
        }

    }
    //List<NetworkPlayer> playerList = new List<NetworkPlayer>();
    //public int playerCount;

    private void Update()
    {
        if ((int)SpawnMethod == (int)SpawnType.Timer && !dead)
        {
            TimerMethod();

            if (player.hasTorch && player.torchIsLit && getDist() < player.currentLightRadius)
            {
                deathFlame.Play();
                dead = true;
                Destroy(gameObject, DestroyTimer);
            }
        }

        if (spawned)
        {
            ParticleSystem.ShapeModule SM = spawnsmoke.shape;
            SM.radius += 0.5f;
        }

        if (spawnsmoke.isStopped) Destroy(gameObject);

        var lookPos = aiGoal.transform.position - transform.position;
        lookPos.y = 0;
        var rotation = Quaternion.LookRotation(lookPos);
        transform.rotation = Quaternion.LerpUnclamped(transform.rotation, rotation, 0.1f);
    }

    void TimerMethod()
    {
        if (currTimer > 0)
        {
            currTimer -= Time.deltaTime;
        }
        else if (currTimer <= 0 && !spawned && getDist() > lightRadii)
        {
            SpawnEnemy();
        }
    }

    public void SpawnEnemy()
    {
        Vector3 pos = transform.position;
        GameObject temp = Instantiate(enemyPrefab, new Vector3(pos.x, pos.y + (enemyPrefab.GetComponent<CapsuleCollider>().height / 2), pos.z), Quaternion.identity);
        GetComponent<MeshRenderer>().enabled = false;
        temp.GetComponent<EnemyAi>().player = aiGoal;
        spawned = true;
        currTimer = timer;
        ParticleSystem.MainModule mm = spawnsmoke.main;
        var em = spawnsmoke.emission;
        var rate = new ParticleSystem.MinMaxCurve();
        rate.constantMax = 100;
        em.rateOverTime = rate;
        mm.loop = false;
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
