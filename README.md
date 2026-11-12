# 🪐 Herta Station Homelab

A bare-metal, high-availability home Kubernetes cluster managed 100% declaratively via GitOps with Flux v2.

---

## 🖥️ Cluster Architecture

The cluster runs **K3s** across three bare-metal nodes:

| Node | Role |
| :--- | :--- |
| **`lenovorader`** | Control-Plane |
| **`acerrader`** | Worker |
| **`mirader`** | Worker |

---

## 🛠️ Tech Stack

* **Kubernetes Distribution**: [K3s](https://k3s.io/) (Lightweight Kubernetes)
* **GitOps & Delivery**: [Flux v2](https://fluxcd.io/) (Kustomize + Helm Controller, 4-tier dependency pipeline)
* **CNI & Service Mesh**: [Cilium](https://cilium.io/) (v1.20, eBPF host routing, `kube-proxy` replacement, Hubble UI, L2 announcements)
* **Ingress & Gateway**: [Cilium Ingress & Gateway API](https://docs.cilium.io/en/stable/network/servicemesh/) (Native Envoy routing with cleartext HTTP/2 `h2c` upstream support)
* **Database Engine**: [CloudNativePG (CNPG)](https://cloudnative-pg.io/) (High-availability declarative PostgreSQL cluster)
* **Secrets Management**: [External Secrets Operator](https://external-secrets.io/) (ESO syncing secrets from Google Cloud Secret Manager)
* **Identity & Access Management (IAM)**: [ZITADEL](https://zitadel.com/) (Centralized SSO & OIDC authentication provider)
* **Local Developer Tooling**: [`mise-en-place`](https://mise.jdx.dev/) (pinned `kubectl`, `flux2`, `hk`, `python`, `gcloud`, `terraform`)

---

## 📂 Repository Structure

```text
homelab/
├── clusters/
│   └── herta/                  # Flux Kustomizations dependency chain
│       ├── flux-system/        # GitRepository & Flux components
│       ├── infrastructure-controllers.yaml  # CNPG, Cilium, External Secrets, Node-BlueZ
│       ├── infrastructure-configs.yaml      # Postgres cluster, L2 IP pools, ClusterSecretStore
│       ├── databases.yaml      # Declarative CNPG databases & roles pipeline
│       └── apps.yaml           # User applications pipeline
├── infrastructure/
│   ├── controllers/            # Helm releases & daemonsets (Cilium, CNPG, ESO, Node-BlueZ)
│   └── configs/                # Shared cluster configs (HA Postgres, Cilium L2 pools, ESO stores)
├── databases/                  # Declarative DBs, roles & secrets (Linkding, Zitadel)
└── apps/
    ├── base/                   # Environment-agnostic app definitions
    └── herta/                  # Cluster-specific overlays (Ingress, Gateway, configs, secrets)
```

---

## 🚀 Active Workloads & Services

* **Dashboard**: [Homepage](https://gethomepage.dev/) (`http://homepage.homenir.com`)
  * Custom Apple Liquid Glass UI aesthetic with live cluster metrics.
  * Exposed via Cilium Ingress (`192.168.18.195`).
  * Hardened non-root security profile (`runAsUser: 1000`, dropped capabilities).
* **Identity & Access Management**: [ZITADEL](https://zitadel.com/) (`http://auth.homenir.com`)
  * Centralized Identity Provider (IdP) for homelab Single Sign-On (SSO) and OIDC.
  * Backed by CloudNative-PG HA PostgreSQL with automated schema bootstrapping.
  * Exposed via **Cilium Gateway API** (`192.168.18.196`) with native HTTP/2 (`h2c`) upstream gRPC multiplexing.
* **Bookmarks**: [Linkding](https://github.com/sissbruecker/linkding) (`http://linkding.homenir.com`)
  * Integrated with **Zitadel OIDC** for single sign-on authentication (`LD_ENABLE_OIDC: True`).
  * Backed by dedicated CNPG database and role (`linkding`), credentials managed via External Secrets.
  * Local-path PVC for thumbnail caching.
* **Home Automation**: [Home Assistant](https://www.home-assistant.io/) (`http://ha.homenir.com`)
  * Containerized Home Assistant core with host Bluetooth integration via declarative `node-bluez` DaemonSet.
  * D-Bus socket sharing and unconfined AppArmor for direct hardware Bluetooth device tracking.
* **Network Observability**: [Hubble](https://github.com/cilium/hubble)
  * Deep eBPF-level flow inspection and real-time service map via Hubble UI.

---

## 🗺️ Planned Roadmap & Improvements

* [ ] **Automated TLS & Security**:
  * [ ] Deploy `cert-manager` for automated Let's Encrypt / Cloudflare Origin TLS certificates.
  * [ ] Enforce HTTPS end-to-end on Gateway and Ingress endpoints.
* [ ] **Observability & Monitoring**:
  * [ ] Prometheus + Grafana metrics stack.
  * [ ] Centralized cluster logging.
  * [ ] Uptime Kuma for service availability monitoring.

---

## 💻 Operations Quickstart

Manage tools and Git hooks with [`mise`](https://mise.jdx.dev/):

```bash
# Install all pinned CLI tools (kubectl, flux2, hk, python, gcloud, terraform)
mise install

# Trigger immediate GitOps sync across all pipelines
mise flux:sync
mise flux:reconcile

# Run local code hygiene and YAML validation hooks via hk
mise hk:check
```
