# Identity pool

resource "google_iam_workload_identity_pool" "pool" {
  provider = google-beta
  project  = var.project_id

  workload_identity_pool_id = var.pool_id
  display_name              = var.pool_display_name
  description               = var.pool_description
  disabled                  = var.pool_disabled
}

# Identity pool provider

resource "google_iam_workload_identity_pool_provider" "provider" {
  provider = google-beta
  project  = var.project_id

  workload_identity_pool_id = google_iam_workload_identity_pool.pool.workload_identity_pool_id

  workload_identity_pool_provider_id = var.provider_id
  display_name                       = var.provider_display_name
  description                        = var.provider_description
  disabled                           = var.provider_disabled

  attribute_mapping   = var.attribute_mapping
  attribute_condition = var.attribute_condition
  oidc {
    allowed_audiences = var.allowed_audiences
    issuer_uri        = var.issuer_uri
  }
}

# Service account impersonation

resource "google_service_account_iam_member" "member" {
  for_each = { for index, account in var.service_accounts : index => account }

  service_account_id = each.value.name
  member             = "${each.value.all_identities == false ? "principal" : "principalSet"}://iam.googleapis.com/${google_iam_workload_identity_pool.pool.name}/${each.value.attribute}"
  role               = "roles/iam.workloadIdentityUser"
}
