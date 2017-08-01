using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Networking;

public class EnemySpawner : NetworkBehaviour {

    public GameObject enemyPrefab;
    public Transform aiGoal;


    public override void OnStartServer()
    {
        Vector3 pos;
        if (RandomPoint(transform.position, 10.0f, out pos))
        {
            GameObject temp = Instantiate(enemyPrefab, new Vector3(pos.x, pos.y + (enemyPrefab.GetComponent<CapsuleCollider>().height / 2), pos.z), Quaternion.identity);
            NetworkServer.Spawn(temp);
        }
    }

    // Use this for initialization
    //void Start() {
    //    Vector3 pos;
    //    if (RandomPoint(transform.position, 10.0f, out pos)){
    //        GameObject temp = Instantiate(enemyPrefab, new Vector3(pos.x, pos.y + (enemyPrefab.GetComponent<CapsuleCollider>().height / 2), pos.z), Quaternion.identity);
    //        temp.GetComponent<EnemyAi>().goal = aiGoal;
    //    }
    //}

    // Update is called once per frame
    void Update() {

    }

    bool RandomPoint(Vector3 center, float range, out Vector3 result)
    {
        for (int i = 0; i < 30; i++)
        {
            Vector3 randomPoint = center + Random.insideUnitSphere * range;
            NavMeshHit hit;
            if (NavMesh.SamplePosition(randomPoint, out hit, 1.0f, NavMesh.AllAreas))
            {
                result = hit.position;
                return true;
            }
        }
        result = Vector3.zero;
        return false;
    }
}
