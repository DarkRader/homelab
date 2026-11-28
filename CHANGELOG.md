# Changelog

## [0.1.0](https://github.com/DarkRader/homelab/compare/v0.0.1...v0.1.0) (2026-11-28)


### ✨ New Features

* add devcontainer with mise ([552cea9](https://github.com/DarkRader/homelab/commit/552cea9211021b29c197cca4b7f00a4314bbc653))
* **apps:** deploy Home Assistant with Cilium ingress on ha.homenir.com ([b6b625b](https://github.com/DarkRader/homelab/commit/b6b625b4fe3c9c191f4969c72f64b73c3f7595ae))
* **cert-manager:** add controller ([f89c04b](https://github.com/DarkRader/homelab/commit/f89c04bbc6b02b3119782a55f093f28544629491))
* **database:** deploy dedicated cnpg cluster for linkding ([11ca62f](https://github.com/DarkRader/homelab/commit/11ca62f2fc5bd3ce0c7636b44ddc1e2aafb37b08))
* **database:** deploy dedicated cnpg cluster for zitadel ([8a6cbe5](https://github.com/DarkRader/homelab/commit/8a6cbe5bdb9d0a516aa08fd37c09924ff1f2ca01))
* **database:** enable barman-cloud backup plugin and daily schedules for linkding and zitadel ([93de2a1](https://github.com/DarkRader/homelab/commit/93de2a163615fbf8b2931d86e6b7335c2fef3824))
* **db:** bootstrap databases pipeline and declare linkding postgres db ([51e133b](https://github.com/DarkRader/homelab/commit/51e133bfe3769ff177b776d2338460fb5130e2ce))
* **external-dns:** add controller resources ([d28b4e0](https://github.com/DarkRader/homelab/commit/d28b4e0471e7c95bde1e1ecbff4feb2d259e82c8))
* **herta:** bootstrap apps root and deploy homepage dashboard ([1ac50f7](https://github.com/DarkRader/homelab/commit/1ac50f70b3cc02976796e6e50855f6203772a31b))
* **home-assistant:** prepare resources ([71b0dbf](https://github.com/DarkRader/homelab/commit/71b0dbf7dcbecb6f8078e30b7c5e09ebc6eca6f8))
* **infra:** activate cilium controller and l2 announcement pools in gitops ([9b4b581](https://github.com/DarkRader/homelab/commit/9b4b581be8da16bf6bb262e33eaa0e9fc51513fc))
* **infra:** add barman-cloud plugin for cnpg backups ([b9d8f6b](https://github.com/DarkRader/homelab/commit/b9d8f6b7192d8ad2a150372a7f565bd6b640c836))
* **infra:** add central cloudflare-tunnel controller on herta cluster ([b0df7c4](https://github.com/DarkRader/homelab/commit/b0df7c45a8aba533ccd39d0bac6f081c0f2d157a))
* **infra:** add cilium load balancer ip pools and l2 announcement policies ([09e0c3f](https://github.com/DarkRader/homelab/commit/09e0c3f2ea66468d308d66fc7abf07fffc2e14f5))
* **infra:** add cloudnative-pg operator and postgres cluster ([1f37f26](https://github.com/DarkRader/homelab/commit/1f37f26e9673cfeccc31fb509f00b24cc96e45ff))
* **infra:** add declarative node-bluez daemonset for host bluetooth ([92a391b](https://github.com/DarkRader/homelab/commit/92a391b6889100cad5ddad2b5cf8b0d78d53213a))
* **infra:** add external-dns controller for cloudflare on herta cluster ([06dbba7](https://github.com/DarkRader/homelab/commit/06dbba709bee303cfeb94d1912faa4c17c07a295))
* **infra:** add GCP Terraform GitHub Actions pipeline and smoke test ([#2](https://github.com/DarkRader/homelab/issues/2)) ([95f62ed](https://github.com/DarkRader/homelab/commit/95f62ed781009fca755cbabff81e5ad40dc65574))
* **infra:** add reusable GCS bucket module and per-app CNPG backup buckets ([#5](https://github.com/DarkRader/homelab/issues/5)) ([44ead78](https://github.com/DarkRader/homelab/commit/44ead789f67230c57fc7b99211036e569af5c8b6))
* **infra:** bootstrap GCP Workload Identity Federation and Terraform state backend ([f8dcd91](https://github.com/DarkRader/homelab/commit/f8dcd91b03c143766466dd279fd23ad4c7521da3))
* **infra:** prepare cilium helm release manifests ([1100097](https://github.com/DarkRader/homelab/commit/1100097c81bedfe1cd3aa6f156c07ab9bbc48d43))
* **infra:** provision cnpg backup service account and store key in secret manager ([#6](https://github.com/DarkRader/homelab/issues/6)) ([d2c9412](https://github.com/DarkRader/homelab/commit/d2c9412fa210331d2e3394b7e519edc2c07799a6))
* **infra:** provision n8n backup bucket and generate secrets ([#7](https://github.com/DarkRader/homelab/issues/7)) ([65f51de](https://github.com/DarkRader/homelab/commit/65f51de1cc6646561e572e8f2f376615a9be687d))
* **linkding:** configure postgres backend, storage, and gitops overlay ([f02ec5c](https://github.com/DarkRader/homelab/commit/f02ec5c3c168c25e3acd5f267ab7f5bb05f8faae))
* **mise:** add config and tools inside of it ([51d4d41](https://github.com/DarkRader/homelab/commit/51d4d417332cbae2136aed43b6a025759498f706))
* **n8n:** add application and database manifests ([c25c49d](https://github.com/DarkRader/homelab/commit/c25c49df04c8aced987748cf0feb2973473f4c44))
* **secrets:** add External Secrets Operator and GCP ClusterSecretStore ([0f0fca2](https://github.com/DarkRader/homelab/commit/0f0fca2e30227cc5acbdb6f84534ffa354f8a7b2))
* **terraform:** add secret module and import existing secrets to state ([#3](https://github.com/DarkRader/homelab/issues/3)) ([741099d](https://github.com/DarkRader/homelab/commit/741099d079bc4a844c6daebf75b0fcfbafb50de6))
* **zitadel:** add in apps with helmrelease and cilium ingress ([e05a497](https://github.com/DarkRader/homelab/commit/e05a4972fc4b0896a49f246681fce87868dfbb94))
* **zitadel:** configure postgres db ([6e3e13c](https://github.com/DarkRader/homelab/commit/6e3e13cc1cdf44a5dfdd654f1ae0ec6561e6f58f))


### 🧱 Updates & Improvements

* add gitignore ([dcb0bc9](https://github.com/DarkRader/homelab/commit/dcb0bc9570c8a4a215a422689df0b1ee051d89f4))
* **apps:** update apps versions ([86d92a3](https://github.com/DarkRader/homelab/commit/86d92a34b6db7c0b02ca8b5b2437c1d88555ee4f))
* **cert-manager:** change metadata name in repo ([a170175](https://github.com/DarkRader/homelab/commit/a17017550f261ee284d8ef63b7f665cb778afe43))
* **cilium:** enable Gateway API with appProtocol support ([7808b75](https://github.com/DarkRader/homelab/commit/7808b759500a23c0b66b803e5ec0cacf6d3252cb))
* **cloudflare-tunnel:** update image to latest one ([74b3650](https://github.com/DarkRader/homelab/commit/74b3650155c0751ca528daf95d5ab675e12fe304))
* **config:** add .github configs ([555f1ba](https://github.com/DarkRader/homelab/commit/555f1baaf384c889ddffe6bfe3390a08d1290bce))
* **home-assistant:** enable host Bluetooth and D-Bus integration ([e1e6f42](https://github.com/DarkRader/homelab/commit/e1e6f42c73ba50195226280bafc1c21d7865e138))
* **homepage:** add n8n in services section ([b54ec45](https://github.com/DarkRader/homelab/commit/b54ec4544fb9f0a541452a7f02c2d7e9e33b99cd))
* **homepage:** configure subpath volume mounts and rbac per official ([fcd3c5e](https://github.com/DarkRader/homelab/commit/fcd3c5e5d675d27c1d1257ac6caaf5e7344cf373))
* **homepage:** customize dashboard ￹services, wallpaper, and cyan ([aa3d22c](https://github.com/DarkRader/homelab/commit/aa3d22ceb20b96b2b2d3fe525275e7b43b57e805))
* **homepage:** harden container securityContext with non-root profile ([1e88c5d](https://github.com/DarkRader/homelab/commit/1e88c5d5e7f130174e2bb8e1ca15cccd996c84b2))
* **homepage:** remove Cluster Management section ([d0052a3](https://github.com/DarkRader/homelab/commit/d0052a314b83c85d601d876d02f7aee8455db316))
* **homepage:** update home assistant url and service name ([e72eaae](https://github.com/DarkRader/homelab/commit/e72eaae84eef59a7e59f5baeabafd3486989e57e))
* **homepage:** update ingress and service for cilium ingress controller ([324ab71](https://github.com/DarkRader/homelab/commit/324ab717e70ffd136915ff8f72e2cfaa08222378))
* **homepage:** update url for zitadel ([47cb3c1](https://github.com/DarkRader/homelab/commit/47cb3c12244f8da4affe2d9c076053059094e256))
* **infra:** pin cilium ingress l2 announcements to lenovorader ([03a50be](https://github.com/DarkRader/homelab/commit/03a50beb56b7894e8b053ad47e37a4545ec75daf))
* **ingress:** switch homepage and linkding domains to homenir.com ([a8a418c](https://github.com/DarkRader/homelab/commit/a8a418caf96d34b4e593d90a29012e48facec365))
* **linkding:** change db host to migrated cluster ([8c8a8a4](https://github.com/DarkRader/homelab/commit/8c8a8a47638196d766cf51b28a8a907d197040ba))
* **linkding:** configure oidc with zitadel ([23664c9](https://github.com/DarkRader/homelab/commit/23664c915757193ca811902f28e4c3e991e9fd32))
* **linkding:** expose service via cilium ingress and update homepage link ([d1461bf](https://github.com/DarkRader/homelab/commit/d1461bf13174200a1deb7185232bcabf2b316f46))
* **linkding:** migrate secrets to ExternalSecret ([d0f291a](https://github.com/DarkRader/homelab/commit/d0f291a8795e196250796d1536d09e9574bb35e5))
* **linkding:** remove external-dns annotation in favor of cloudflare-tunnel ([3ebcf7c](https://github.com/DarkRader/homelab/commit/3ebcf7c91cfd15b581c235bff7bc2c10fab51020))
* **linkding:** set true for LD_DISABLE_LOGIN_FORM ([440af53](https://github.com/DarkRader/homelab/commit/440af5339498d79213323bf924425a4cf557d459))
* **mise:** add pre commit checks in tasks ([258f861](https://github.com/DarkRader/homelab/commit/258f8611c4bb3fca726234bdea80fafb7d5508cb))
* **mise:** fix kubectl version and add flux tool ([210d898](https://github.com/DarkRader/homelab/commit/210d8982b2b66a0c8726deb35d9289bf2faa8bbe))
* **mise:** install python and gcloud ([a94d699](https://github.com/DarkRader/homelab/commit/a94d699bed7bd4b1c6f6b2380eff7719c15a8e96))
* **n8n:** configure https and remove external-dns annotation for cloudflare tunnel ([b070097](https://github.com/DarkRader/homelab/commit/b070097dfad136f1b85eacade653ab2aec7d36c3))
* **n8n:** enable application and database in cluster kustomizations ([cdd1173](https://github.com/DarkRader/homelab/commit/cdd11730281684de0e937b300f7eedaa4bb63055))
* **n8n:** update to last version ([74d2b9a](https://github.com/DarkRader/homelab/commit/74d2b9aafb5c2193a1d566889649fb133f410ea1))
* **postgres:** decommission old shared postgres cluster and clean up manifests ([370b1ba](https://github.com/DarkRader/homelab/commit/370b1ba265ac02e628d3bc9d09184cebbd3409da))
* **pre-commit:** remove config file ([13f2fb7](https://github.com/DarkRader/homelab/commit/13f2fb7d9406d7d0f8d66f474946e0f940590036))
* **renovate:** update config ([0f1598d](https://github.com/DarkRader/homelab/commit/0f1598da4bac4de709071b8a42a87e5a177776e1))
* **services:** add manifests for homepage ([b3b7817](https://github.com/DarkRader/homelab/commit/b3b78176e2c7e965fe9c7dc320988715b230e576))
* **services:** add manifests for linkding ([8aab887](https://github.com/DarkRader/homelab/commit/8aab8875bb0ae5b76c8bf0082a6ebd7d29fe4733))
* **services:** separate linkding manifests ([7a5c569](https://github.com/DarkRader/homelab/commit/7a5c569b886282c3d6418c9c31cae47ac7b4065b))
* **terraform:** support secret version rotation and clean up completed imports ([#4](https://github.com/DarkRader/homelab/issues/4)) ([e8ad3e0](https://github.com/DarkRader/homelab/commit/e8ad3e08f231086546620dba3339fc0fcd34b35c))
* **zitadel:** bootstrap initial admin user with external secret ([00794cc](https://github.com/DarkRader/homelab/commit/00794ccef2b9162ef26d15f53d6f490006dd1428))
* **zitadel:** enable ExternalSecure https and update OIDC/homepage URLs ([f5e6b70](https://github.com/DarkRader/homelab/commit/f5e6b701954e0672c66d175905a14fde35a0379d))
* **zitadel:** migrate from Ingress to Gateway API ([0975ac6](https://github.com/DarkRader/homelab/commit/0975ac69d4f4e87bf71d34f49a9a64c57fd7e7e9))
* **zitadel:** switch database host to dedicated cnpg cluster ([3b00ede](https://github.com/DarkRader/homelab/commit/3b00ede691b4b8dc695da54e448fa4f42d7c0d94))


### 🛠️ Fixes

* **bootstrap:** grant serviceAccountKeyAdmin to terraform-applier ([2239a9f](https://github.com/DarkRader/homelab/commit/2239a9f9a7112e332de2b714c7030aef1292f13b))
* **cilium:** restrict native devices to physical ethernet and exclude tailscale ([80871d5](https://github.com/DarkRader/homelab/commit/80871d58530d21189ba327e555b1ad8f0c50da50))
* **herta:** remove targetNamespace from apps kustomization ([323507b](https://github.com/DarkRader/homelab/commit/323507bbec3574b055a76b127efc0a499933372f))
* **home-assistant:** clear rollingUpdate field when switching to Recreate ([9232560](https://github.com/DarkRader/homelab/commit/92325600d2482a6a005cf58e7ea4a8696ab1b48e))
* **home-assistant:** set deployment strategy to Recreate ([399f5bd](https://github.com/DarkRader/homelab/commit/399f5bd1bfea910fb9fb0e2679a7b2cbdbb7fd77))
* **home-assistant:** specify namespace for herta cluster ([7061bad](https://github.com/DarkRader/homelab/commit/7061badb7a6cf552b8a4d0785adc7829f3042f0b))
* **home-assistant:** unconfine AppArmor and enable privileged mode for Bluetooth D-Bus ([ea7cf2b](https://github.com/DarkRader/homelab/commit/ea7cf2b3a03aab7e8023a8b05fa2a0b4cc16b700))
* **homepage:** add proxmox.yaml placeholder to prevent non-root startup crash ([747e895](https://github.com/DarkRader/homelab/commit/747e89520dafa87013a81b27ac0424c74f88c9aa))
* **homepage:** configure HOMEPAGE_ALLOWED_HOSTS environment variable ([feb2560](https://github.com/DarkRader/homelab/commit/feb2560e92628621a632a0137836471bfc26eb07))
* **homepage:** declare homepage namespace across base and overlay kustomizations ([486015b](https://github.com/DarkRader/homelab/commit/486015b183a2ad176765ca8b6d542189a098a9cc))
* **homepage:** explicitly set ingressClassName to cilium ([7a7d739](https://github.com/DarkRader/homelab/commit/7a7d7393503a01d11ccbdcbb3316a213e3663e05))
* **homepage:** mount emptyDir volume ￹for logs directory ([d2b5b17](https://github.com/DarkRader/homelab/commit/d2b5b17793fc61cc3822c8da42f9ab1180a148d2))
* **homepage:** specify runAsUser 1000 for non-root securityContext ([e2d8812](https://github.com/DarkRader/homelab/commit/e2d88128a30ecf93260b5d0032bc745c14dabbd8))
* **homepage:** url for linkding ([d657c06](https://github.com/DarkRader/homelab/commit/d657c062dda27e13e7f40ccc5d7d5a5168313f93))
* **infra:** restrict cilium l2 announcements to worker nodes ([ae097b9](https://github.com/DarkRader/homelab/commit/ae097b91560420ee251d46477d29e1b58f51c1a9))
* **infra:** update external-dns ExternalSecret apiVersion to v1 ([1122069](https://github.com/DarkRader/homelab/commit/1122069b661ce97567dee5f97cf7dd712a56c9d3))
* **pre-commit:** warnings ([d450256](https://github.com/DarkRader/homelab/commit/d450256596367d55e0c322d3fc5de4442fc60aec))
* **secrets:** bump ClusterSecretStore apiVersion to v1 ([5bad180](https://github.com/DarkRader/homelab/commit/5bad1800e4fad39c839bb68158961bb0bd1d8ccc))
* **zitadel:** correct ingress for ui and api path and service name ([0c77f02](https://github.com/DarkRader/homelab/commit/0c77f025c3c5a0a7e947aeb7b1f7a87763ce7f9c))
* **zitadel:** enable initJob with zitadel command to bootstrap eventstore ([e199765](https://github.com/DarkRader/homelab/commit/e199765f2d9553c5d5728d62a708c0d16b7535be))


### 🧹 Refactors

* **homepage:** switch to configMapGenerator with dedicated config files ([bd9403a](https://github.com/DarkRader/homelab/commit/bd9403ada5d21a69ebe0ed492cbf472bbdfeffc2))
* **infra:** introduce herta overlay for controllers and configs ([34a53fc](https://github.com/DarkRader/homelab/commit/34a53fc9896c7d51dcfb3ed2d526cff1e2f257a9))
* use gitops monorepo best practise structure ([fceaf5d](https://github.com/DarkRader/homelab/commit/fceaf5d94c0b560f8c63f1bd4e2738aff4f6d3c9))


### 📝 Documentation

* add homelab architecture, active workloads, and roadmap to README ([599719d](https://github.com/DarkRader/homelab/commit/599719ded2e1a754cb2907724218f07fbacfacba))
* **README:** fix table formating ([a9ca03f](https://github.com/DarkRader/homelab/commit/a9ca03f13fe5f14b754789dcca1a4a4f5c6b3304))
* **README:** update info about homelab ([d1f0d52](https://github.com/DarkRader/homelab/commit/d1f0d52be434e70620ec17bf18078abc0c337528))


### 🧪 Tests & Quality

* **hooks:** migrate from pre-commit to hk ([28dfc48](https://github.com/DarkRader/homelab/commit/28dfc4876838e44d70d0a2e8a0b7cedf68f77805))
* **pre-commit:** config and run pre-commit ([36d14c5](https://github.com/DarkRader/homelab/commit/36d14c506f45d380743347db2c7e0672da326ec8))


### ⚙️ DevOps & CI/CD

* add codebase validation workflow using mise and hk ([d5f48d8](https://github.com/DarkRader/homelab/commit/d5f48d8e8a6fc989fcc457bada85e26feab77602))
* configure standalone hk validation with taplo and check-yaml ([05ced3a](https://github.com/DarkRader/homelab/commit/05ced3aeaf112ce9cffada13d9234d1b6bc9d21e))
* **terraform:** use mise-action for terraform setup and drop required_version ([437ad89](https://github.com/DarkRader/homelab/commit/437ad896633501c004cfc8d4de9c30e2d5b0e76e))
