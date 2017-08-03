using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public class playerMovement : MonoBehaviour{

    [Header("Player Attributes")]
    public int lives;
    public float speed;
    public float lightRadius;
    public float timeTakenToLightTorch;
    public float sprintSpeedMultiplier;
    public float stamina;
    public float staminaDepletionRate;
    public float staminaReplenishRate;
    public float sprintCooldown;
    [Space(10)]

    [Header("Mouse looking")]
    public float XSensitivity   ;
    public float YSensitivity   ;
    public float MaxVeticalLook ;
    public float MinVeticalLook ;
    [Space(10)]

    public float gravity = 9.8f;
    public GameObject head;
    public GameObject torch;

    [HideInInspector] public float currentLightRadius = 0;

    //PRIVATES
    CharacterController _characterController;
    Vector2 _input;
    bool _isWalking;
    bool _running;
    Camera _camera;
    Vector2 mouseLook;
    float currStamina;
    bool outofStamina;
    float currCooldown;
    bool hasTorch;
    [HideInInspector] public bool torchIsLit;
    float torchMeter = 0;

	// Use this for initialization
	void Start () {
        Application.runInBackground = true;
        Cursor.lockState = CursorLockMode.Locked;
        _characterController = GetComponent<CharacterController>();
        _camera = head.GetComponent<Camera>();
        _camera.enabled = true;
        currStamina = stamina;
        hasTorch = true;
        torchIsLit = false;

        //torch.GetComponent<MeshRenderer>().material.color = Color.red;

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


    void OnTriggerStay(Collider other)
    {
        if (!torchIsLit)
        {
            if (other.gameObject.tag == "LightSource" && Input.GetAxis("Light") > 0)
            {
                torchMeter +=Time.deltaTime;
                if (torchMeter >= timeTakenToLightTorch)
                {
                    torchIsLit = true;
                    torch.GetComponent<MeshRenderer>().material.color = Color.red;
                    currentLightRadius = lightRadius;
                }
            }
        }
    }

    void FixedUpdate()
    {
        if (outofStamina)
        {
            currCooldown -= Time.deltaTime;
            if (currCooldown <= 0) outofStamina = false;
        }

        moveFunction();
        if (_running)
        {
            currStamina -= staminaDepletionRate;
        }
        else
        {
            currStamina += staminaReplenishRate;
        }

        if (currStamina <= 0)
        {
            outofStamina = true;
            currCooldown = sprintCooldown;
        }
    }

    void moveFunction()
    {
        if (Input.GetKey(KeyCode.Mouse0))
        {
            torchIsLit = false;
            torchMeter = 0;
            currentLightRadius = 0;
            torch.GetComponent<MeshRenderer>().material.color = Color.gray;
        }

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

        if(Input.GetAxis("Sprint") > 0 && !outofStamina)
        {
            dir *= sprintSpeedMultiplier;
            _running = true;
        }
        else
        {
            _running = false;
        }
 

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
