﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Networking;

public class EnemySpawner : NetworkBehaviour
{

    public GameObject enemyPrefab;
    public Transform aiGoal;

    //List<NetworkPlayer> playerList = new List<NetworkPlayer>();
    //public int playerCount;







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
