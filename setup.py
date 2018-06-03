from setuptools import setup, find_packages
import os


def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()


setup(
    name="ToxAws",
    version="0.1",
    include_package_data=True,
    author="Simon So",
    author_email="simonso@yahoo.com",
    packages=find_packages(),
    long_description=read('README.md'))
