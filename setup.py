from setuptools import setup, find_packages

setup(
    name='accounts',
    version='0.1.0',
    packages=find_packages(),
    install_requires=[
        'Flask>=2.0',
        'Flask-Cors>=3.0',
        'Flask-Talisman>=1.0',
        'gunicorn>=20.0',
    ],
)
