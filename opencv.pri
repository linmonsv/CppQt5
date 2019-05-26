INCLUDEPATH += /usr/local/include
QMAKE_CFLAGS += $(pkg-config --libs opencv)
QMAKE_CXXFLAGS = $$QMAKE_CFLAG
