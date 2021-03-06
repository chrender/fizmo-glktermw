


   **Version 0.2.3 — Febuary 19, 2019**

 - Fixed potential compile errors due to relative paths in autoconf parameters.
 - Updated obsolete AC\_TRY\_LINK to AC\_LINK\_IFELSE.
 - Updated tiny-xml-doc-tools.
 - Fixed markdown underscores.

---


   **Version 0.2.2 — September 3, 2017**

 - Renamed copyright files to “license” for github license detection compatibility, see [Github's “Licensing a repository”](https://help.github.com/articles/licensing-a-repository/) for further reference.
 - Added missing contributor phrasing to BSD-3 clause. The resulting license now exactly matches the wording used on Github and so also makes the license detection work.

---


   **Version 0.2.1 — August 31, 2016**

 - Use tiny-xml-doc-tools for documentation.

---


   **Version 0.2.0 — April 10, 2016**

 - Adaptations for libglkif version 0.2.0: Separate glk and glktermw from each other.

---


   **Version 0.1.8 — October 16, 2015**

 - Minor adaptations due to libglkif version 0.1.9.

---


   **Version 0.1.7 — October 9, 2015**

 - Minor autoconf-related changes for fizmo-dist-0.7.10-compatibility.

---


   **Version 0.1.6 — March 19, 2014**

 - Added missing license/copyright information.

---


   **Version 0.1.5 — June 5, 2013**

 - Adapted to new libfizmo function calls.

---


   **Version 0.1.4 — September 17, 2012**

 - Adapted to new autoconf/automake build process.

---


   **Version 0.1.3 — August 1, 2012**

 - Merged with Andrew Plotkin's iOS-fizmo implementation: Moved functionality of “glk\_ask\_user\_for\_file” into libglkif.

---


   **Version 0.1.2 — March 9, 2012**

 - Fixed missing $(DESTDIR) variable – should already have been present since version 0.1.1.

---


   **Version 0.1.1 — November 6, 2011**

 - Fixed missing “override” statments for CFLAGS in Makefiles.
 - Fixed $(DESTDIR) evaluation in config.[default|macports].mk.
 - Adapted Makefiles and configuration to use standard GNU Makefile variables instead of INSTALL\_PATH and FIZMO\_BIN\_DIR.
 - Respect LD\_FLAGS for linking.

---


   **Version 0.1.0 — September 18, 2011**

 - fizmo-glktermw is an example how to use the libglkif module to implement a GLK-based frontend, in this case using glktermw. Please note that version 0.1.0 should be still considered quite experimental.
 - This interface was built from code in Andrew Plotkin's github repository. Please note that bug reports should be sent to [mailto:fizmo@spellbreaker.org](mailto:fizmo@spellbreaker.org) instead of sending them to Andrew Plotkin.


