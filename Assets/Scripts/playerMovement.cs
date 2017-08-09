using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public class playerMovement : MonoBehaviour{

    [Header("Player Attributes")]
    public int lives;
    public float speed;
    [Space(5)]
    [Header("Light Stuff")]
    public float lightRadius;
    public float lightSwingDuration;
    public float lightSwingRadiusIncrease;
    public float lightEffectiveness;
    public float lightDecreaseEffect;
    public float swingStaminaCost;
    public float timeTakenToLightTorch;
    [Space(5)]
    [Header("Sprint Stuff")]
    public float sprintSpeedMultiplier;
    public float stamina;
    public float staminaDepletionRate;
    public float staminaReplenishRate;
    public float sprintCooldown;
    [Space(10)]

    [Header("Mouse looking")]
    public float XSensitivity   ;
    public float YSensitivity   ;
    public float MaxVerticalLook ;
    public float MinVerticalLook ;
    [Space(10)]

    public float gravity = 9.8f;
    public GameObject head;
    public GameObject torch;
    public GameObject FlameParticle;
    public GameObject LightSource;
    public UnityEngine.UI.Image JAM;

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
    [HideInInspector] public bool hasTorch;
    [HideInInspector] public bool torchIsLit;
    float torchMeter = 0;
    [HideInInspector] public bool swingingTorch;
    [HideInInspector] public bool successfullySwung;
    float currentTorchSwingDuration;
    Material torchMaterial;
    Color torchColor;
    int maxLife;
    bool dead = false;

    // Use this for initialization
    void Start () {
        Application.runInBackground = true;
        Cursor.lockState = CursorLockMode.Locked;
        _characterController = GetComponent<CharacterController>();
        _camera = head.GetComponent<Camera>();
        _camera.enabled = true;
        currStamina = stamina;
        maxLife = lives;
        hasTorch = true;
        JAM.color = new Vector4(1,1,1, 0);
        torchMaterial = torch.GetComponent<Renderer>().material;
        torchColor = torchMaterial.GetColor("_EmissionColor");
        TurnLightOff();



        //if (!GetComponent<NetworkIdentity>().isLocalPlayer)
        //{
        //    Destroy(_camera.gameObject);
        //    Destroy(gameObject.GetComponent<playerMovement>());
        //}
    }

    void Update () {
        if (lives <= 0) dead = true;

        if (!dead)
        {
            Look();
            InteractWithObjects();

            if (swingingTorch)
            {
                if (currentTorchSwingDuration > lightSwingDuration)
                {
                    swingingTorch = false;
                    successfullySwung = false;
                    currentLightRadius -= lightSwingRadiusIncrease;
                    currentTorchSwingDuration = 0;
                }
                currentTorchSwingDuration += Time.deltaTime;
            }
        }
        else
        {
            JAM.GetComponentInParent<Animator>().enabled = true;
            Cursor.lockState = CursorLockMode.None;
        }
    }

    void InteractWithObjects()
    {
        RaycastHit hit;
        if (Physics.Raycast(head.transform.position, head.transform.forward, out hit, 1.0f))
        {
            if (hit.transform.tag == "Interactable" && Input.GetAxis("Interact") != 0)
            {
                if (hit.transform.GetComponent<DoorScript>())
                {
                    hit.transform.GetComponent<DoorScript>().triggerActivate(); 
                }
            }
        }
    }

    void OnTriggerStay(Collider other)
    {
        if (!torchIsLit)
        {
            if (other.gameObject.tag == "LightSource" && Input.GetAxis("Light") > 0)
            {
                torchMeter +=Time.deltaTime;
                if (torchMeter >= timeTakenToLightTorch)
                {
                    TurnLightOn();
                }
            }
        }
    }

    void FixedUpdate()
    {
        if (!dead)
        {
            if (outofStamina)
            {
                currCooldown -= Time.deltaTime;
                if (currCooldown <= 0) outofStamina = false;
            }
            moveFunction();
        }
    }

    void moveFunction()
    {
        //if (Input.GetKey(KeyCode.Mouse1))
        //{
        //    torchIsLit = false;
        //    torchMeter = 0;
        //    currentLightRadius = 0;
        //    torch.GetComponent<MeshRenderer>().material.color = Color.gray;
        //}

        if (Input.GetKey(KeyCode.Mouse0) && !swingingTorch && torchIsLit)
        {
            swingingTorch = true;
            currentLightRadius += lightSwingRadiusIncrease;
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
            currStamina -= staminaDepletionRate;
        }
        else
        {
            _running = false;
            currStamina += staminaReplenishRate;
        }
        
        if (currStamina <= 0)
        {
            outofStamina = true;
            currCooldown = sprintCooldown;
        }

        int swing = !swingingTorch ? 1 : 0;

        dir *= swing;

        _characterController.SimpleMove(dir);
    }
    
    void Look()
    {
        Vector2 dir = new Vector2(Input.GetAxisRaw("Mouse X"), Input.GetAxisRaw("Mouse Y"));
        dir = Vector2.Scale(dir, new Vector2(XSensitivity, YSensitivity));
        mouseLook += dir;

        mouseLook.y = Mathf.Clamp(mouseLook.y, MinVerticalLook, MaxVerticalLook);

        transform.localRotation = Quaternion.AngleAxis(mouseLook.x, transform.up);
        _camera.transform.localRotation = Quaternion.AngleAxis(-mouseLook.y, Vector3.right);

    }

    void TurnLightOff()
    {
        torchIsLit = false;
        torch.GetComponent<Renderer>().material.SetColor("_EmissionColor", Color.black);
        FlameParticle.GetComponent<ParticleSystem>().Stop();
        LightSource.GetComponent<Light>().enabled = false;
        currentLightRadius = 0;
    }

    void TurnLightOn()
    {
        torchIsLit = true;
        torch.GetComponent<Renderer>().material.SetColor("_EmissionColor", torchColor);
        FlameParticle.GetComponent<ParticleSystem>().Play();
        LightSource.GetComponent<Light>().enabled = true;
        currentLightRadius = lightRadius;
    }

    public void DealDamage()
    {
        lives--;
        JAM.color = new Vector4(1, 1, 1, (1.0f - (float)lives / maxLife));
    }
}
