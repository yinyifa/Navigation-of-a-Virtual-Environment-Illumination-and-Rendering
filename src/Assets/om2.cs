using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class om2 : MonoBehaviour
{
    [Range(0f, 20f)] [SerializeField] private float speed = 0.6f;
    void Update()
    {
        this.transform.RotateAround(Vector3.zero, Vector3.left, speed);
    }
}
