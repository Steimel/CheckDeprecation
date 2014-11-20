CheckDeprecation
================

Rake task to find and display deprecation warnings from the rails log


Installation
============

Simply add check_deprecation.rake to your rails app in lib/tasks


Usage
=====

To view deprecation warnings from all files in log/, use check_deprecation:all
```
rake check_deprecation:all
```

To view deprecation warnings from a particular file in log/, use check_deprecation:for[]
```
rake check_deprecation:for[development.log]
```
