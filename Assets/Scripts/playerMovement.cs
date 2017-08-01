using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public class playerMovement : MonoBehaviour{

    [Header("Player Attributes")]
    public float speed;
    public float lightRadius;
    [Space(10)]

    [Header("Mouse looking")]
    public float XSensitivity   ;
    public float YSensitivity   ;
    public float MaxVeticalLook ;
    public float MinVeticalLook ;
    [Space(10)]

    public float gravity = 9.8f;
    public GameObject head;

    //PRIVATES
    CharacterController _characterController;
    Vector2 _input;
    bool _isWalking;
    Camera _camera;
    Vector2 mouseLook;

	// Use this for initialization
	void Start () {
        Application.runInBackground = true;
        Cursor.lockState = CursorLockMode.Locked;
        _characterController = GetComponent<CharacterController>();
        _camera = head.GetComponent<Camera>();
        _camera.enabled = true;

        
        //if (!GetComponent<NetworkIdentity>().isLocalPlayer)
        //{
        //    Destroy(_camera.gameObject);
        //    Destroy(gameObject.GetComponent<playerMovement>());
        //}
    }
	
	// Update is called once per frame
	void Update () {
        //jumping
        Look();
    }

    //void OnDrawGizmosSelected()
    //{
    //    Gizmos.color = Color.yellow;
    //    Gizmos.DrawWireSphere(transform.position, lightRadius);
    //}

    void FixedUpdate()
    {
        moveFunction();
    }

    void moveFunction()
    {
        // Read input
        float horizontal =  Input.GetAxis("Horizontal");
        float vertical = Input.GetAxis("Vertical");

        _input = new Vector2(horizontal, vertical);

        // normalize input if it exceeds 1 in combined length:
        if (_input.sqrMagnitude > 1) _input.Normalize();

        if (horizontal != 0 || vertical != 0)
        {
            _isWalking = true;
        }
        else
        {
            _isWalking = false;
        }

        Vector3 dir = (transform.forward * _input.y + transform.right * _input.x) * speed;

        if(!_characterController.isGrounded) dir.y -= gravity;

        _characterController.Move(dir *  Time.deltaTime);
        
    }
    
    void Look()
    {
        Vector2 dir = new Vector2(Input.GetAxisRaw("Mouse X"), Input.GetAxisRaw("Mouse Y"));
        dir = Vector2.Scale(dir, new Vector2(XSensitivity, YSensitivity));
        mouseLook += dir;

        mouseLook.y = Mathf.Clamp(mouseLook.y, MinVeticalLook, MaxVeticalLook);

        transform.localRotation = Quaternion.AngleAxis(mouseLook.x, transform.up);
        _camera.transform.localRotation = Quaternion.AngleAxis(-mouseLook.y, Vector3.right);

    }
}
