using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class objectMove : MonoBehaviour
{
    [Range(0f, 20f)] [SerializeField] private float speed = 0.3f;
    void Update()
    {
        this.transform.RotateAround(Vector3.zero, Vector3.right, speed);
    }
}
