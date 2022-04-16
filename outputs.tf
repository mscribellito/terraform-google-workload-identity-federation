# Identity pool

output "pool_id" {
  value = google_iam_workload_identity_pool.pool.id
}

output "pool_state" {
  value = google_iam_workload_identity_pool.pool.state
}

output "pool_name" {
  value = google_iam_workload_identity_pool.pool.name
}

# Identity pool provider

output "provider_id" {
  value = google_iam_workload_identity_pool_provider.provider.id
}

output "provider_state" {
  value = google_iam_workload_identity_pool_provider.provider.state
}

output "provider_name" {
  value = google_iam_workload_identity_pool_provider.provider.name
}
