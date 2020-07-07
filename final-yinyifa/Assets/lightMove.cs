using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class lightMove : MonoBehaviour
{
    [Range(0f, 20f)] [SerializeField] private float speed = 0.3f;
    void Update()
    {
        this.transform.RotateAround(Vector3.zero, new Vector3(0,1,0), speed);
    }
}
