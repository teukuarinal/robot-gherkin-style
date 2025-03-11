import sys
import subprocess

def run_tests():
    args = sys.argv[1:]  # Capture command-line arguments
    command = [
        "poetry", "run", "robot",
        "-d", "reports",  # Save results in "reports"
    ]

    use_allure = True  # Default menggunakan Allure
    include_tags = []
    exclude_tags = []

    i = 0
    while i < len(args):
        if args[i] == "--exclude":
            exclude_tags.append(args[i + 1])
            i += 2
        elif args[i] == "--no-allure":
            use_allure = False  # Matikan Allure jika flag ini ditemukan
            i += 1
        else:
            include_tags.append(args[i])
            i += 1

    if use_allure:
        command.extend(["--listener", "allure_robotframework"])  # Gunakan Allure

    if include_tags:
        command.append("--include")
        command.extend(include_tags)

    if exclude_tags:
        command.append("--exclude")
        command.extend(exclude_tags)

    command.append("robot_project/tests/")  # Sesuai struktur proyek

    print(f"Running: {' '.join(command)}")
    result = subprocess.run(command)

    # Generate Allure Report jika diaktifkan
    if use_allure:
        print("\nGenerating Allure Report...")
        subprocess.run(["poetry", "run", "allure", "generate", "reports", "-o", "reports/allure-report", "--clean"])

    exit(result.returncode)

if __name__ == "__main__":
    run_tests()
