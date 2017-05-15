# Teste

## features

### git:feature/compile-native 3fa6e53

* _Objetivo_: Testar a compilação nativa com autotools e
[androgenizer][1].
* Status: **[OK]**

```bash
    $ make compile-native
```
### git:feature/nudando-nome-da-aplicacao 332d41c

* _Objetivo_: Mudar o nome do aplicativo compilado pelo autotools.
* Status: **[OK]**

Repetimos o processo de compilação, mas nesse momento vamos
altera o nome da aplicação sem mudar o nome do source e
verificar se a compilação funciona mediante as alteraçoes.

As mudanças seguem abaixo:

Era assim
```
    bin_PROGRAMS = main
    main_SOURCES = main.c
    maindir      = $(includedir)

    all-local: Android.mk

    Android.mk: Makefile.am
            androgenizer \
            -:PROJECT main \
            -:REL_TOP $(top_srcdir) -:ABS_TOP $(abs_top_srcdir) \
            -:EXECUTABLE main \
            -:SOURCES $(main_SOURCES) \
    > $@
```

Ficou assim

```
    $ git show 332d41c:jni/src/Makefile.am
    bin_PROGRAMS = main
    main_SOURCES = main.c
    maindir      = $(includedir)

    all-local: Android.mk

    Android.mk: Makefile.am
            androgenizer \
            -:PROJECT main \
            -:REL_TOP $(top_srcdir) -:ABS_TOP $(abs_top_srcdir) \
            -:EXECUTABLE main \
            -:SOURCES $(main_SOURCES) \
    > $@
```

**NOTA**: para ver o arquivo e após a mudanca, eu utilizei o comando
**git show**.

### git:feature/configurando-Make-install 099f70b

* _Objetivo_: Instalar e desisntalar o aplicativo no celular
  utilizando adb via comando de linha.
* Status: **[OK]**

Instalando, ou seja copiando o aplicativo para o celular.

```bash
    $ make install-native
```

Mesmo não sendo escopo desse teste, testei o aplicativo e
o mesmo rodou com perfeição.

```bash
    $ adb shell
    $ cd data/dev
    $ ./App
    Hello world!
```

Remove o aplicativo do celular.

```bash
    $ make uninstall-native
```




[1]: https://github.com/lopesivan/androgenizer
[2]: http://sdcc.sourceforge.net/
[3]: http://gputils.sourceforge.net/
