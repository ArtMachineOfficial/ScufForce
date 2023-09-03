using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AutoShoot : MonoBehaviour
{
    public GameObject bulletPrefabs;
    public Transform firePoint;
    public ShootProfile shootProfile;

    private float totalSpread;
    private WaitForSeconds rate, interval;


    void OnEnable()
    {
        interval = new WaitForSeconds(shootProfile.interval);
        rate = new WaitForSeconds(shootProfile.fireRate);

        if (firePoint == null)
            firePoint = transform;

        totalSpread = shootProfile.spread * shootProfile.amount;

        StartCoroutine(ShootingSequence());
    }
    private void OnDisable()
    {
        StopAllCoroutines();
    }

    IEnumerator ShootingSequence()
    {
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
        GameObject temp = PoolingManager.instance.UseObject(bulletPrefabs, firePoint.position, firePoint.rotation);
        temp.name = shootProfile.damage.ToString();
        temp.transform.Rotate(Vector3.up, angle);
        temp.GetComponent<BulletMove>().speed = shootProfile.speed;
    }    
}
