using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DoorScript : MonoBehaviour
{
    bool opened;
    Vector3 origin;

    void Start()
    {
        origin = transform.localEulerAngles;
    }
    public void triggerActivate()
    {
        opened = !opened;
        if (opened)
            transform.eulerAngles = (new Vector3(0, 90, 0));
        else
            transform.eulerAngles = (origin);
    }
}
