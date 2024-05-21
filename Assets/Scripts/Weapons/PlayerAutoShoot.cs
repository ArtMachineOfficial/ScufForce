using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PlayerAutoShoot : MonoBehaviour
{
    public GameObject bulletPrefabs;
    public Transform firePoint;
    public ShootProfile shootProfile;

    private float totalSpread;
    private WaitForSeconds rate, interval;
    private float _lastShotTime = 0f;
    private float _cooldown = 0.5f;

    private void Update()
    {
        interval = new WaitForSeconds(shootProfile.interval); 
        rate = new WaitForSeconds(shootProfile.fireRate);

        if (firePoint == null)
            firePoint = transform;

        totalSpread = shootProfile.spread * shootProfile.amount;

        if (!PauseMenu.isPaused)
        {
            if (Input.GetMouseButtonDown(0))
                if (Time.time - _lastShotTime > _cooldown)
                {
                    StartCoroutine(ShootingSequence());
                }
            if (Input.GetMouseButtonUp(0))
                StopAllCoroutines();
        }
    }

    private void OnDisable()
    {
        StopAllCoroutines();
    }

    IEnumerator ShootingSequence()
    {
        _lastShotTime = Time.time;
        yield return rate;

        while (true)
        {
            float angle = 0f;


            for (int i = 0; i < shootProfile.amount; i++)
            {
                angle = totalSpread * (i / (float)shootProfile.amount);
                angle -= (totalSpread / 2f) - (shootProfile.spread / shootProfile.amount);

                Shoot(angle);
                if (shootProfile.fireRate > 0f)
                    yield return rate;
            }

            yield return interval;
        }
    }

    void Shoot(float angle)
    {
        Quaternion bulletRotation = Quaternion.Euler(firePoint.eulerAngles.x, firePoint.eulerAngles.y, 0f);

        GameObject temp = PoolingManager.instance.UseObject(bulletPrefabs, firePoint.position, bulletRotation);
        temp.name = shootProfile.damage.ToString();
        temp.transform.Rotate(Vector3.up, angle);
        temp.GetComponent<BulletMove>().speed = shootProfile.speed;
        PoolingManager.instance.ReturnObject(temp, shootProfile.destroyRate);
    }
}
