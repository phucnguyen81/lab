if __name__ == "__main__":
    import os
    import sys

    from django.core.management import execute_from_command_line

    # Hardcoded Django settings
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'app')

    execute_from_command_line(sys.argv)
