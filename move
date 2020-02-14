using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class move : MonoBehaviour
{
    public float velo;
    public float forcevalue;
    public float jumpvalue;
    private Rigidbody rigidbody;
    private AudioSource audio;
    
    // Start is called before the first frame update
    void Start()
    {
        rigidbody = GetComponent<Rigidbody>();
        audio = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    private void Update()
    {
        if (Input.GetButton("Jump") && Mathf.Abs(rigidbody.velocity.y) < 0.01)
        {
            rigidbody.AddForce(Vector3.up * jumpvalue, ForceMode.Impulse);
            audio.Play();
        }
        
    }
    void FixedUpdate()
    {
        rigidbody.AddForce(new Vector3(Input.GetAxis("Horizontal"),
            0,
            Input.GetAxis("Vertical")*forcevalue));
        
    }
    private void OnCollisionEnter(Collision collision)
    {
        GameObject other = collision.gameObject;
        if (other.tag == "Enemy")
        {
            other.GetComponent<MeshRenderer>().material.color *= 0.01f;
            print("Collision");
            Destroy(collision.gameObject);
        }

        //else

          //  other.GetComponent<MeshRenderer>().material.color /= 0.03f;
           // print("Aqui estas entrando a un mundo desconocido wow");

            //Destroy(collision.gameObject);
        
    }
    }
    
 //   private void OnTriggerEnter(Collider other)
   // {
     //   print("Se ha insertado el tejo en la canasta");
       // if (other.tag == "Tejo")
        //{
          //  other.GetComponent<MeshRenderer>().material.color *= 0.005f;
        //    print("Esta funcion es para cuando toque la esfera a un cuadrado este cambie de color");
        //}
    //}

//}
