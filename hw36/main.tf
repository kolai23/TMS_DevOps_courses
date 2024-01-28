import {
  id = "projects/seismic-vista-405108/zones/us-east1-c/instances/4931349455175157622"
  to = google_compute_instance.instance-1
}

import {
  id = "projects/seismic-vista-405108/zones/us-east1-b/instances/7504119734036034383"
  to = google_compute_instance.instance-3
}


import {
  id = "projects/seismic-vista-405108/global/networks/vabnet"
  to = google_compute_network.vabnet
}

import {
  id = "projects/seismic-vista-405108/regions/us-east1/subnetworks/vabnet-subnet01"
  to = google_compute_subnetwork.vabnet-subnet01
}

import {
  id = "projects/seismic-vista-405108/regions/us-east1/subnetworks/vabnet-subnet02"
  to = google_compute_subnetwork.vabnet-subnet02
}

import {
  id = "projects/seismic-vista-405108/global/networks/vabnet02"
  to = google_compute_network.vabnet02
}

import {
  id = "projects/seismic-vista-405108/regions/us-east1/subnetworks/vabnet02-subnet01"
  to = google_compute_subnetwork.vabnet02-subnet01
}

import {
  id = "seismic-vista-405108/vabnet/vabnet-vabnet02-peering"
  to = google_compute_network_peering.vabnet-vabnet02-peering
}

import {
  id = "seismic-vista-405108/vabnet02/vabnet02-vabnet-peering"
  to = google_compute_network_peering.vabnet02-vabnet-peering
}

import {
  id = "seismic-vista-405108"
  to = google_app_engine_application.default
}

import {
  id = "apps/seismic-vista-405108/services/default/versions/20240116t212334"
  to = google_app_engine_standard_app_version.default 
}

import {
  id = "apps/seismic-vista-405108/services/default/versions/20240117t210351"
  to = google_app_engine_flexible_app_version.default 
}
