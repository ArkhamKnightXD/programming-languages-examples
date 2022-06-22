from tkinter import ttk
from tkinter import *
from tkinter import filedialog
import xml.dom.minidom

from pyswip import Prolog


class configuracion: 
    def __init__(self):
        self.prolog = Prolog()
        self.__getConfiguration()

    def __getConfiguration(self):
        self.dialogConfiguracion = Toplevel()
        self.dialogConfiguracion.geometry('500x100')
        self.dialogConfiguracion.title("Configuración ")

        self.xmlbtn = Button(self.dialogConfiguracion, text = "Cargar XML", command=self.cargarXml)
        self.xmlbtn.grid(column=0, row=0)

        self.dtdbtn = Button(self.dialogConfiguracion, text = "Cargar DTD", command=self.cargarDtd)
        self.dtdbtn.grid(column=0, row=1)

        self.dialogConfiguracion.mainloop()


    def cargarXml(self):
        self.filenameXml = filedialog.askopenfilename(initialdir="./", title="Selecciona un Archivo XML", filetypes=(("archivos xml", "*.xml"),("todos los archivos", "*")))
        Label(self.dialogConfiguracion, text=self.filenameXml).grid(column=1, row=0)

    def cargarDtd(self):
        self.filenameDtd = filedialog.askopenfilename(initialdir="./", title="Selecciona un Archivo DTD", filetypes=(("archivos dtd", "*.dtd"),("todos los archivos", "*")))
        Label(self.dialogConfiguracion, text=self.filenameDtd).grid(column=1, row=1)

        self.validarBtn = Button(self.dialogConfiguracion, text = "Validar XML con DTD", command=self.validarXml)
        self.validarBtn.grid(column=1, row=2)

    def validarXml(self):
        archivoXml = open(self.filenameXml, 'r')
        print(archivoXml)
        # resultado = validar(archivoXml)
        # print(resultado)
        try:
            xml.dom.minidom.parseString(archivoXml.read())
            #cargamos las definiciones dinamicas de prolog
            self.prolog.consult("definiciones-prolog.pl")
            #validar_dtd(self.filenameXml, self.filenameDtd)
            Label(self.dialogConfiguracion, text="Archivo XML validado", foreground="green").grid(column=1, row=3)

            #cargamos el archivo xml
            docxml = xml.dom.minidom.parse(self.filenameXml)

            recetas = docxml.getElementsByTagName("receta")

            #cargamos la información del xml en prolog
            for receta in recetas:
                for ingrediente in receta.getElementsByTagName("ingrediente"):
                    self.prolog.assertz("receta({0},{1})".format(receta.getElementsByTagName("titulo")[0].firstChild.data, ingrediente.firstChild.data))

                for procedimiento in receta.getElementsByTagName("procedimiento"):
                    self.prolog.assertz("procedimiento({0},{1})".format(receta.getElementsByTagName("titulo")[0].firstChild.data, procedimiento.firstChild.data))
        except:
            Label(self.dialogConfiguracion, text="Error, el archivo XML no es valido", foreground="red").grid(column=1, row=3)

        # if :
            
            
        
        # else:
            
            