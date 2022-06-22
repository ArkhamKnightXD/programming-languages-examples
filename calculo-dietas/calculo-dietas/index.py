from tkinter import ttk
from tkinter.ttk import *
from tkinter import *
from tkinter import scrolledtext

import configuration

from pyswip import Prolog

class Aplicacion:
    def __init__(self, window):
        # Inicializacion
        self.prolog = Prolog()
        self.wind = window
        self.wind.geometry('700x450')
        self.wind.title('Calculador de Dietas')
        self.wind.resizable(width=0, height=0)

        configuracionBtn = Button(self.wind, text="Configuración", command=configuration.configuracion)
        configuracionBtn.grid(column=4, row=1, pady = 30)

        accionesLbl = Label(self.wind, text='Acciones')
        accionesLbl.grid(column=4, row=2)


        datalogTxt = scrolledtext.ScrolledText(self.wind, width=85,height=15)
        datalogTxt.grid(column=4, row=7)

        accionesCombo = Combobox(self.wind, width=60)
        accionesCombo['values'] = (
            "-----Seleccione la Acción que Quiere Ejecutar-----",
            "¿Cuáles platos se pueden preparar si tengo un ingrediente específico?",
            "¿Cuáles platos se pueden prepara si tengo 3 ingredientes específicos?",
            "¿Cuáles platos implican usar la batidora como procedimiento?",
            "Si no tengo batidora, ¿Cuáles platos puedo hacer?",
            "Si no tengo mantequilla, ¿qué plato puedo preparar?",
            "Si no tengo huevos ni tengo batidora, ¿qué platos puedo preparar?"
        )
        accionesCombo.current(0)
        accionesCombo.grid(column=4, row=3)


        self.ingredienteLbl = Label(self.wind, text="Indique Ingrediente")
        self.ingredienteLbl.grid(column=4, row=4)
        self.txt = Entry(self.wind, width=20)
        self.txt.grid(column=4, row=5)
        

        #primera selección
        def callback(eventObject):
            datalogTxt.delete('1.0', END)
            if accionesCombo.current() == 1:
                def opcion1():
                    datalogTxt.delete('1.0', END)
                    datalogTxt.insert(INSERT, "Los platos que se pueden crear son: \n")
                    for plato in list(self.prolog.query("plato(P,{0})".format(self.txt.get()))):
                        datalogTxt.insert(INSERT," - " + plato['P'] + "\n")
                self.verPlatosBtn = Button(self.wind, text="Ver Platos", command=opcion1)
                self.verPlatosBtn.grid(column=4, row=6)

            elif accionesCombo.current() == 2:
                self.verPlatosBtn.destroy()
                def opcion1():
                    datalogTxt.delete('1.0', END)
                    datalogTxt.insert(INSERT, "Los platos que se pueden crear son: \n")
                    palabras = self.txt.get().split(",")
                    for plato in list(self.prolog.query("plato(P,{0},{1},{2})".format(palabras[0],palabras[1],palabras[2]))):
                        datalogTxt.insert(INSERT," - " + plato['P'] + "\n")
                self.verPlatosBtn = Button(self.wind, text="Ver Platos", command=opcion1)
                self.verPlatosBtn.grid(column=4, row=6)
            elif accionesCombo.current() == 3:
                datalogTxt.delete('1.0', END)
                datalogTxt.insert(INSERT, "Los platos que se pueden crear son: \n")
                dic = {}
                for plato in list(self.prolog.query("plato_con_batidora(P)")):
                    dic[plato['P']] = plato['P'] 

                for key in dic:
                    datalogTxt.insert(INSERT," - " + dic[key] + "\n")

            elif accionesCombo.current() == 4:
                datalogTxt.delete('1.0', END)
                datalogTxt.insert(INSERT, "Los platos que se pueden crear son: \n")
                dic = {}
                for plato in list(self.prolog.query("plato_sin_batidora(P)")):
                    dic[plato['P']] = plato['P'] 

                for key in dic:
                    datalogTxt.insert(INSERT," - " + dic[key] + "\n")

            elif accionesCombo.current() == 5:
                datalogTxt.delete('1.0', END)
                datalogTxt.insert(INSERT, "Los platos que se pueden crear son: \n")
                dic = {}
                for plato in list(self.prolog.query("plato_sin_mantequilla(P)")):
                    dic[plato['P']] = plato['P'] 

                for key in dic:
                    datalogTxt.insert(INSERT," - " + dic[key] + "\n")
            elif accionesCombo.current() == 6:
                datalogTxt.delete('1.0', END)
                datalogTxt.insert(INSERT, "Los platos que se pueden crear son: \n")
                dic = {}
                for plato in list(self.prolog.query("plato_sin_huevos_sin_batidora(P)")):
                    dic[plato['P']] = plato['P'] 

                for key in dic:
                    datalogTxt.insert(INSERT," - " + dic[key] + "\n")
            

            

        accionesCombo.bind("<<ComboboxSelected>>", callback)
        

if __name__ == '__main__':
    window = Tk()
    app = Aplicacion(window)
    window.mainloop()