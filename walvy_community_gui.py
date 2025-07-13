import tkinter as tk

class WalvyCommunityGUI:
    def __init__(self, master):
        self.master = master
        master.title("Walvy Community")
        master.configure(bg='black')
        master.geometry("400x300")

if __name__ == '__main__':
    root = tk.Tk()
    gui = WalvyCommunityGUI(root)
    root.mainloop()
