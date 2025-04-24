
# Install required Ansible collections:
```bash
    ansible-galaxy collection install community.kubernetes
    ansible-galaxy collection install kubernetes.core
```

# Run the Playbook

```bash
    ansible-playbook -i inventory.ini deploy-kube-prometheus.yml
```
