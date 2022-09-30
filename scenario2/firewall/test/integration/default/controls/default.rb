title 'Verifying Internet traffic'

gcp_project_id = attribute('project_id', default: 'winter-charmer-363215', description: 'The GCP project identifier.')

control "default" do

  title 'Ensure Ingress traffic from internet only has https'

  describe google_compute_firewall(project: gcp_project_id,name: "allow-https-only-firewall") do
    
    # For the currently in scope rule, SSH should not be allowed
    its('allowed_ssh?')  { should be false }
    # For the currently in scope rule, RDP should not be allowed
    its('allowed_rdp?')  { should be false }
    # For the currently in scope rule, HTTP should not be allowed
    its('allowed_http?')  { should be false }
    # For the currently in scope rule, HTTPS should be allowed
    its('allowed_https?')  { should be true }

    # the rule direction - ingress/egress
    its('direction') { should eq "INGRESS" }

  end
end