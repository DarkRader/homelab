# 🪐 Herta Station Homelab

A bare-metal, high-availability home Kubernetes cluster managed 100% declaratively via GitOps with Flux v2.

---

## 🖥️ Cluster Architecture

The cluster runs **K3s** across three bare-metal nodes:

| Node | Role IP | Notes |
| :--- | :--- | :--- | :--- |
| **`lenovorader`** | Control-Plane |
| **`acerrader`** | Worker |
| **`mirader`** | Worker |

---

## 🛠️ Tech Stack

* **Kubernetes Distribution**: [K3s](https://k3s.io/) (Lightweight Kubernetes)
* **GitOps & Delivery**: [Flux v2](https://fluxcd.io/) (Kustomize + Helm Controller)
* **Database Engine**: [CloudNativePG (CNPG)](https://cloudnative-pg.io/) (HA PostgreSQL operator)
* **Ingress Controller**: [Traefik](https://traefik.io/) (Built-in K3s ingress)
* **Local Developer Tooling**: [`mise-en-place`](https://mise.jdx.dev/) (pinned `kubectl`, `flux2`, `pre-commit`)

---

## 📂 Repository Structure

```text
homelab/
├── clusters/
│   └── herta/                  # Flux Kustomizations dependency chain
│       ├── flux-system/        # GitRepository & Flux components
│       ├── infrastructure-controllers.yaml
│       ├── infrastructure-configs.yaml
│       ├── databases.yaml      # Declarative CNPG database pipeline
│       └── apps.yaml           # User applications pipeline
├── infrastructure/
│   ├── controllers/            # Helm operators (CloudNativePG, Cilium prep)
│   └── configs/                # Shared cluster infrastructure (HA Postgres cluster)
├── databases/                  # Declarative DBs & roles (e.g. Linkding)
└── apps/
    ├── base/                   # Environment-agnostic app definitions
    └── herta/                  # Cluster-specific overlays (Ingress, domain routing)
```

---

## 🚀 Current Reality (Active Workloads)

* **Dashboard**: [Homepage](https://gethomepage.dev/) (`http://homepage.192.168.18.41.sslip.io`)
  * Custom Apple Liquid Glass UI aesthetic with live cluster metrics.
  * Modular configuration via `configMapGenerator` for zero-downtime rolling restarts.
  * Hardened non-root security profile (`runAsUser: 1000`, dropped capabilities).
* **Bookmarks**: [Linkding](https://github.com/sissbruecker/linkding) (`http://192.168.18.41:4001`)
  * Attached to the shared HA PostgreSQL cluster via dedicated CNPG `Database` and `DatabaseRole` CRDs.
  * Local-path PVC for bookmark thumbnail caching.
* **Storage & Persistence**: `local-path` provisioner with strict anti-affinity across worker nodes.

---

## 🗺️ Planned Roadmap & Improvements

* [ ] **Cilium CNI Migration**:
  * Replace Flannel and `kube-proxy` with full eBPF host routing.
  * Deep network observability and flow inspection via **Hubble UI**.
  * Cilium L2 Announcements for external IP allocations.
* [ ] **Observability & Monitoring**:
  * Prometheus + Grafana metrics stack.
  * Loki for centralized cluster logging.
  * Uptime Kuma for external endpoint status monitoring.
* [ ] **Identity & Security**:
  * Zitadel for unified Single Sign-On (SSO).
  * Vaultwarden for self-hosted secret management.
  * Automated TLS certificates via cert-manager and Let's Encrypt / Cloudflare.
* [ ] **Home Automation**:
  * Home Assistant integration.

---

## 💻 Operations Quickstart

Manage tools with [`mise`](https://mise.jdx.dev/):

```bash
# Install all pinned CLI tools (kubectl, flux, pre-commit)
mise install

# Trigger immediate GitOps sync across all pipelines
mise run flux:reconcile

# Run local code hygiene and YAML validation
mise run pre-commit
```
