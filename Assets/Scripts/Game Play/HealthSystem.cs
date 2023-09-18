using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HealthSystem : MonoBehaviour
{
    public float maxHealth = 10f;
    public GameObject hitEffect, healthBar;
    public bool isEnemy = true;

    private string tagName;
    private float _currentHealth;
    private DeathSystem deathScript;
    private bool dead;


    void OnEnable()
    {
        if (isEnemy)
            tagName = "Bullet";
        else
            tagName = "EnemyBullet";


        _currentHealth = maxHealth;
    }

    private void Start()
    {
        if (isEnemy) LevelManager.instance.RegisterEnemy();
        deathScript = GetComponent<DeathSystem>();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(tagName))
        {
            if (!isEnemy)
                LevelManager.instance.PlayerHit();
            Vector3 triggerPosition = other.ClosestPointOnBounds(transform.position);
            Vector3 direction = triggerPosition - transform.position;

            GameObject fx = PoolingManager.instance.UseObject(hitEffect, triggerPosition, Quaternion.LookRotation(direction));

            PoolingManager.instance.ReturnObject(fx, 1f);

            float damage = float.Parse(other.name);
            TakeDamage(damage);

            PoolingManager.instance.ReturnObject(other.gameObject);
        }
    }

    public void TakeDamage(float damage)
    {
        _currentHealth -= damage;
        CheckHealth();
        UpdateUI();
    }

    void CheckHealth()
    {
        if (_currentHealth <= 0f)
        {
            if (healthBar != null)
                healthBar.transform.parent.gameObject.SetActive(false);
           
            if (deathScript != null)
                deathScript.Death();

            if (isEnemy && !dead)
            {
                dead = true;
                gameObject.tag = "Untagged";
                LevelManager.instance.AddEnemyKill();
            }
               

            
        }
    }

    void UpdateUI()
    {
        if (healthBar != null)
        {
            Vector3 scale = Vector3.one;
            float value = _currentHealth / maxHealth;
            scale.x = value;
            healthBar.transform.localScale = scale;
        }
    }
}
