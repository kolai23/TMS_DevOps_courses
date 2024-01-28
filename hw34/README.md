### 1. Установить Terraform.
### 2. Написать шаблон для создания виртуальной машины в облаке.

#### [File link](create_vm_engine.tf)

### 3. Познакомиться с командами:
- terraform init - создается каталог .terraform и скачиваются плагины
- terraform fmt - форматирует текст в файле
- terraform validate - проверяет файлы конфигурации в каталоге
- terraform plan - проверка синтаксиса
- terraform apply - применить конфигурацию
- terraform destroy - удаляет созданые ресурсы 
### 4. Создать виртуальную машину в облаке при помощи ранее созданного шаблона.
```bash

PS C:\Users\Admin\Documents\GitHub\mikalai-vabishchevich\hw34> terraform.exe init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/google...
- Installing hashicorp/google v5.10.0...
- Installed hashicorp/google v5.10.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
PS C:\Users\Admin\Documents\GitHub\mikalai-vabishchevich\hw34> terraform.exe plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_compute_instance.webserver will be created
  + resource "google_compute_instance" "webserver" {
      + can_ip_forward       = false
      + cpu_platform         = (known after apply)
      + current_status       = (known after apply)
      + deletion_protection  = false
      + effective_labels     = {
          + "goog-ec-src" = "vm_add-tf"
        }
      + enable_display       = false
      + guest_accelerator    = (known after apply)
      + id                   = (known after apply)
      + instance_id          = (known after apply)
      + label_fingerprint    = (known after apply)
      + labels               = {
          + "goog-ec-src" = "vm_add-tf"
        }
      + machine_type         = "e2-small"
      + metadata             = {
          + "startup-script" = "sudo apt update"
        }
      + metadata_fingerprint = (known after apply)
      + min_cpu_platform     = (known after apply)
      + name                 = "instance-5"
      + project              = "seismic-vista-405108"
      + self_link            = (known after apply)
      + tags                 = [
          + "http-server",
          + "https-server",
        ]
      + tags_fingerprint     = (known after apply)
      + terraform_labels     = {
          + "goog-ec-src" = "vm_add-tf"
        }
      + zone                 = "us-central1-a"

      + boot_disk {
          + auto_delete                = true
          + device_name                = "instance-5"
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20231213a"
              + labels = (known after apply)
              + size   = 10
              + type   = "pd-standard"
            }
        }

      + network_interface {
          + internal_ipv6_prefix_length = (known after apply)
          + ipv6_access_type            = (known after apply)
          + ipv6_address                = (known after apply)
          + name                        = (known after apply)
          + network                     = (known after apply)
          + network_ip                  = (known after apply)
          + stack_type                  = (known after apply)
          + subnetwork                  = "projects/seismic-vista-405108/regions/us-central1/subnetworks/default"
          + subnetwork_project          = (known after apply)

          + access_config {
              + nat_ip       = (known after apply)
              + network_tier = "PREMIUM"
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
          + provisioning_model  = "STANDARD"
        }

      + shielded_instance_config {
          + enable_secure_boot          = false
          + enable_vtpm                 = true
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
PS C:\Users\Admin\Documents\GitHub\mikalai-vabishchevich\hw34> terraform.exe apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_compute_instance.webserver will be created
  + resource "google_compute_instance" "webserver" {
      + can_ip_forward       = false
      + cpu_platform         = (known after apply)
      + current_status       = (known after apply)
      + deletion_protection  = false
      + effective_labels     = {
          + "goog-ec-src" = "vm_add-tf"
        }
      + enable_display       = false
      + guest_accelerator    = (known after apply)
      + id                   = (known after apply)
      + instance_id          = (known after apply)
      + label_fingerprint    = (known after apply)
      + labels               = {
          + "goog-ec-src" = "vm_add-tf"
        }
      + machine_type         = "e2-small"
      + metadata             = {
          + "startup-script" = "sudo apt update"
        }
      + metadata_fingerprint = (known after apply)
      + min_cpu_platform     = (known after apply)
      + name                 = "instance-5"
      + project              = "seismic-vista-405108"
      + self_link            = (known after apply)
      + tags                 = [
          + "http-server",
          + "https-server",
        ]
      + tags_fingerprint     = (known after apply)
      + terraform_labels     = {
          + "goog-ec-src" = "vm_add-tf"
        }
      + zone                 = "us-central1-a"

      + boot_disk {
          + auto_delete                = true
          + device_name                = "instance-5"
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image  = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20231213a"
              + labels = (known after apply)
              + size   = 10
              + type   = "pd-standard"
            }
        }

      + network_interface {
          + internal_ipv6_prefix_length = (known after apply)
          + ipv6_access_type            = (known after apply)
          + ipv6_address                = (known after apply)
          + name                        = (known after apply)
          + network                     = (known after apply)
          + network_ip                  = (known after apply)
          + stack_type                  = (known after apply)
          + subnetwork                  = "projects/seismic-vista-405108/regions/us-central1/subnetworks/default"
          + subnetwork_project          = (known after apply)

          + access_config {
              + nat_ip       = (known after apply)
              + network_tier = "PREMIUM"
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
          + provisioning_model  = "STANDARD"
        }

      + shielded_instance_config {
          + enable_integrity_monitoring = true
          + enable_secure_boot          = false
          + enable_vtpm                 = true
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_compute_instance.webserver: Creating...
google_compute_instance.webserver: Still creating... [10s elapsed]
google_compute_instance.webserver: Still creating... [20s elapsed]
google_compute_instance.webserver: Creation complete after 27s [id=projects/seismic-vista-405108/zones/us-central1-a/instances/instance-5]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
PS C:\Users\Admin\Documents\GitHub\mikalai-vabishchevich\hw34>
```
### 5. Поменять тип виртуальной машины (увеличить количество ресурсов) через веб консоль и выполнить terraform plan. Что предлагает сделать Terraform?

Так как состояние машины поменялось terraform пытается создать новые обьекты с состоянием описаным в вайле конфирурации.

```bash
PS C:\Users\Admin\Documents\GitHub\mikalai-vabishchevich\hw34> terraform.exe plan 
google_compute_instance.instance-web: Refreshing state... [id=projects/seismic-vista-405108/zones/us-central1-a/instances/instance-5]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # google_compute_instance.instance-web will be updated in-place
  ~ resource "google_compute_instance" "instance-web" {
        id                   = "projects/seismic-vista-405108/zones/us-central1-a/instances/instance-5"
      ~ machine_type         = "e2-medium" -> "e2-small"
        name                 = "instance-5"
        tags                 = [
            "http-server",
            "https-server",
        ]
        # (18 unchanged attributes hidden)

      - service_account {
          - email  = "vabischevich-terraform@seismic-vista-405108.iam.gserviceaccount.com" -> null
          - scopes = [
              - "https://www.googleapis.com/auth/cloud-platform",
            ] -> null
        }

        # (4 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

PS C:\Users\Admin\Documents\GitHub\mikalai-vabishchevich\hw34> terraform.exe apply     
google_compute_instance.instance-web: Refreshing state... [id=projects/seismic-vista-405108/zones/us-central1-a/instances/instance-5]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # google_compute_instance.instance-web will be updated in-place
  ~ resource "google_compute_instance" "instance-web" {
        id                   = "projects/seismic-vista-405108/zones/us-central1-a/instances/instance-5"
      ~ machine_type         = "e2-medium" -> "e2-small"
        name                 = "instance-5"
        tags                 = [
            "http-server",
            "https-server",
        ]
        # (18 unchanged attributes hidden)

      - service_account {
          - email  = "vabischevich-terraform@seismic-vista-405108.iam.gserviceaccount.com" -> null
          - scopes = [
              - "https://www.googleapis.com/auth/cloud-platform",
            ] -> null
        }

        # (4 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_compute_instance.instance-web: Modifying... [id=projects/seismic-vista-405108/zones/us-central1-a/instances/instance-5]
╷
│ Error: Changing the machine_type, min_cpu_platform, service_account, enable_display, shielded_instance_config, scheduling.node_affinities or network_interface.[#d].(network/subnetwork/subnetwork_project) or advanced_machine_features on a started instance requires stopping it. To acknowledge this, please set allow_stopping_for_update = true in your config. You can also stop it by setting desired_status = "TERMINATED", but the instance will not be restarted after the update.
│
│   with google_compute_instance.instance-web,
│   on create_vm_engine.tf line 9, in resource "google_compute_instance" "instance-web":
│    9: resource "google_compute_instance" "instance-web" {
```
