# Replace the placeholder with the actual repo init command for ROM repo
repo_init_command="repo init -u https://github.com/Rom-Name/manifest -b tiramisu"

# Prompt the user to enter the required information
read -p "Enter the ROM repo init command (e.g., $repo_init_command): " user_repo_init_command

# Check if the user provided a custom repo init command
if [ -n "$user_repo_init_command" ]; then
    # Use the user-provided repo init command
    repo_init_command="$user_repo_init_command"
fi

# Display the repo init command
echo "Running repo init command: $repo_init_command"

# Execute the repo init command
$repo_init_command

# Add a new line for clarity
echo

# Add a new line for clarity
echo

# Clone local_manifests repository
clone_command="git clone https://github.com/Evolution-X-viva/local_manifests .repo/local_manifests"
echo "Running clone command: $clone_command"
$clone_command

# Run repo sync command
repo_sync_command="repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags"
echo "Running repo sync command: $repo_sync_command"
$repo_sync_command
