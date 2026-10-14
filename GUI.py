import BLL
import tkinter as tk
from decimal import Decimal
from tkinter import messagebox, filedialog
from tkinter import ttk

def printDebug():
    print("Hello World")

def clearAll():
    displaySinnersA()
    selectSinnerA.set('')
    selectSinnerB.set('')
    selectIdentityA['values'] = []
    selectIdentityA.set('')
    selectSkillA['values'] = []
    selectSkillA.set('')
    displaySinnersB()
    selectIdentityB['values'] = []
    selectIdentityB.set('')
    selectSkillB['values'] = []
    selectSkillB.set('')
    deleteIdentity['values'] = []
    deleteIdentity.set('')
    deleteSkill['values'] = []
    deleteSkill.set('')
    coinTreeA.delete(*coinTreeA.get_children())
    chanceTreeA.delete(*chanceTreeA.get_children())
    coinTreeB.delete(*coinTreeB.get_children())
    chanceTreeB.delete(*chanceTreeA.get_children())

def displaySinnersA():
    for x in identityTreeA.get_children():
        identityTreeA.delete(x)

    sinnerList = BLL.limbusBLL.getSinners()
    for sinners in sinnerList:
        identityTreeA.insert(parent="", index="end", values=(sinners,))
    identityTreeA.heading("Name", text="Sinner Name")
def displaySinnersB():
    for x in identityTreeB.get_children():
        identityTreeB.delete(x)

    sinnerList = BLL.limbusBLL.getSinners()
    for sinners in sinnerList:
        identityTreeB.insert(parent="", index="end", values=(sinners,))
    identityTreeB.heading("Name", text="Sinner Name")

def addCustomSkill():
    try:
        message = BLL.limbusBLL.addUpdateSkill(addSinner.get(),addIdentity.get(),addSkill.get(),addBase.get(),addCoins.get(),addPower.get())
        messagebox.showinfo(title="Success",message=message)
    except Exception as e:
        messagebox.showerror(title="Error",message=e)
    finally:
        clearAll()
def deleteCustomSkill():
    try:
        message = BLL.limbusBLL.deleteSkill(deleteSinner.get(),deleteIdentity.get())
        messagebox.showinfo(title="Success",message=message)
    except Exception as e:
        messagebox.showerror(title="Error",message=e)
    finally:
        clearAll()

def displayIdentitiesA():
    sinnerName = selectSinnerA.get()
    for x in identityTreeA.get_children():
        identityTreeA.delete(x)

    identityList = BLL.limbusBLL.getIdentities(sinnerName)
    for identities in identityList:
        identityTreeA.insert(parent="", index="end", values=(identities,))
def displayIdentitiesB():
    sinnerName = selectSinnerB.get()
    for x in identityTreeB.get_children():
        identityTreeB.delete(x)

    identityList = BLL.limbusBLL.getIdentities(sinnerName)
    for identities in identityList:
        identityTreeB.insert(parent="", index="end", values=(identities,))

def displaySkillsA():
    sinner = selectSinnerA.get()
    identity = selectIdentityA.get()
    for x in identityTreeA.get_children():
        identityTreeA.delete(x)
    skillList = BLL.limbusBLL.getSkills(sinner, identity)
    for skills in skillList:
        identityTreeA.insert(parent="", index="end", values=(skills,))
def displaySkillsB():
    sinner = selectSinnerB.get()
    identity = selectIdentityB.get()
    for x in identityTreeB.get_children():
        identityTreeB.delete(x)
    skillList = BLL.limbusBLL.getSkills(sinner, identity)
    for skills in skillList:
        identityTreeB.insert(parent="", index="end", values=(skills,))
def displayCustomSkills(event):
    sinner = deleteSinner.get()
    identity = deleteIdentity.get()
    skills = BLL.limbusBLL.getCustomSkills(sinner, identity)
    deleteSkill['values'] = skills
    deleteSkill.set('')

def displayCoinA(event):
    sinner = selectSinnerA.get()
    identity = selectIdentityA.get()
    skill = selectSkillA.get()
    SP = Decimal(selectSPA.get())
    for x in coinTreeA.get_children():
        coinTreeA.delete(x)
    for z in chanceTreeA.get_children():
        chanceTreeA.delete(z)
    coinDetails = BLL.limbusBLL.getSkillDetails(sinner, identity, skill)
    newChance = BLL.limbusBLL.getNewChance(sinner, identity, skill, SP)
    for coin in coinDetails:
        coinTreeA.insert(parent="", index="end", values=(coin.basePower, coin.coinNumber, coin.coinPower))
        maxPower = BLL.limbusBLL.findHigher(coin.basePower, (coin.basePower + (coin.coinNumber * coin.coinPower)))
        chanceTreeA.insert(parent="", index="end", values=(maxPower, f"{newChance:.2f}%"))
def displayCoinB(event):
    sinner = selectSinnerB.get()
    identity = selectIdentityB.get()
    skill = selectSkillB.get()
    SP = Decimal(selectSPB.get())
    for x in coinTreeB.get_children():
        coinTreeB.delete(x)
    for z in chanceTreeB.get_children():
        chanceTreeB.delete(z)
    coinDetails = BLL.limbusBLL.getSkillDetails(sinner, identity, skill)
    newChance = BLL.limbusBLL.getNewChance(sinner, identity, skill, SP)
    for coin in coinDetails:
        coinTreeB.insert(parent="", index="end", values=(coin.basePower, coin.coinNumber, coin.coinPower))
        maxPower = BLL.limbusBLL.findHigher(coin.basePower, (coin.basePower+(coin.coinNumber*coin.coinPower)))
        chanceTreeB.insert(parent="", index="end", values=(maxPower, f"{newChance:.2f}%"))

def onSPChangeA():
    sinner = selectSinnerA.get()
    identity = selectIdentityA.get()
    skill = selectSkillA.get()
    SP = Decimal(selectSPA.get())
    for x in chanceTreeA.get_children():
        newChance = BLL.limbusBLL.getNewChance(sinner, identity, skill, SP)
        chanceTreeA.set(x, "Chance", f"{newChance:.2f}%")
def onSPChangeB():
    sinner = selectSinnerB.get()
    identity = selectIdentityB.get()
    skill = selectSkillB.get()
    SP = Decimal(selectSPB.get())
    for x in chanceTreeB.get_children():
        newChance = BLL.limbusBLL.getNewChance(sinner, identity, skill, SP)
        chanceTreeB.set(x, "Chance", f"{newChance:.2f}%")


def onSinnerSelectedA(event):
    sinner = selectSinnerA.get()
    identities = BLL.limbusBLL.getIdentities(sinner)
    selectIdentityA['values'] = identities
    selectIdentityA.set('')
    selectSkillA.set('')
    identityTreeA.heading("Name", text="Identity Name")
    displayIdentitiesA()
def onSinnerSelectedB(event):
    sinner = selectSinnerB.get()
    identities = BLL.limbusBLL.getIdentities(sinner)
    selectIdentityB['values'] = identities
    selectIdentityB.set('')
    selectSkillB.set('')
    identityTreeB.heading("Name", text="Identity Name")
    displayIdentitiesB()
def onSinnerSelectedAdd(event):
    sinner = addSinner.get()
    identities = BLL.limbusBLL.getIdentities(sinner)
    addIdentity['values'] = identities
def onSinnerSelectedDelete(event):
    sinner = deleteSinner.get()
    identities = BLL.limbusBLL.getIdentities(sinner)
    deleteIdentity['values'] = identities

def onIdentitySelectedA(event):
    sinner = selectSinnerA.get()
    identity = selectIdentityA.get()
    skills = BLL.limbusBLL.getSkills(sinner, identity)
    selectSkillA['values'] = skills
    selectSkillA.set('')
    identityTreeA.heading("Name", text="Skill Name")
    displaySkillsA()
def onIdentitySelectedB(event):
    sinner = selectSinnerB.get()
    identity = selectIdentityB.get()
    skills = BLL.limbusBLL.getSkills(sinner, identity)
    selectSkillB['values'] = skills
    selectSkillB.set('')
    identityTreeB.heading("Name", text="Skill Name")
    displaySkillsB()

def tryClash():
    rowsA = coinTreeA.get_children()
    rowsB = coinTreeB.get_children()
    SPA = Decimal(selectSPA.get())
    SPB = Decimal(selectSPB.get())
    if not rowsB or not rowsA:
        messagebox.showerror(title="Error", message="Please Select Skills for Both Sides")
    rowIDA = rowsA[0]
    rowIDB = rowsB[0]
    coinA = coinTreeA.item(rowIDA, "values")
    coinB = coinTreeB.item(rowIDB, "values")
    clashResult = BLL.limbusBLL.simClash(int(coinA[0]),int(coinA[1]),int(coinA[2]),SPA,int(coinB[0]),int(coinB[1]),int(coinB[2]),SPB)
    if clashResult == 3:
        messagebox.showinfo("Result", "Draw!")
    elif clashResult == 2:
        messagebox.showinfo("Result", "Right Side Win!")
    elif clashResult == 1:
        messagebox.showinfo("Result", "Left Side Win!")

def exportTree():
    path = filedialog.asksaveasfilename(defaultextension=".csv",filetypes=(("CSV Files", "*.csv"),))
    columns = identityTreeB["columns"]
    rows = []
    for x in identityTreeB.get_children():
        rows.append(identityTreeB.item(x)["values"])
    BLL.limbusBLL.exportCSV(columns, rows, path)

def loginWindow():
    loginWindow = tk.Toplevel()
    loginWindow.title("Login")
    loginWindow.geometry("260x80")
    tk.Label(loginWindow, text="Username").grid(row=0, column=1)
    userEntry = tk.Entry(loginWindow)
    userEntry.grid(row=0, column=3)
    tk.Label(loginWindow, text="Password").grid(row=1, column=1)
    passEntry = tk.Entry(loginWindow, show="*")
    passEntry.grid(row=1, column=3)
    def loginAttempt():
        username = userEntry.get()
        password = passEntry.get()
        if BLL.limbusBLL.login(username, password):
            loginWindow.destroy()
            showMain()
            root.deiconify()
        else:
            messagebox.showerror("Error", "Invalid username/password")
    tk.Button(loginWindow, text="Login", command=loginAttempt).grid(row=2, column=2)

root = tk.Tk()
root.after(0, loginWindow)
root.withdraw()
root.title("Limbus Company")
root.geometry("1200x800")
root.columnconfigure(0, weight=1)
root.columnconfigure(1, weight=1)
root.columnconfigure(2, weight=1)
tk.Label(root, text="Limbus Company Clash Prediction", font=('Cascadia Code', 12)).grid(row=0, column=0)

identityTreeA = ttk.Treeview(root, columns="Name", show="headings", height=13)
identityTreeA.column("Name", width=500)
identityTreeA.grid(row=2, column=0)
identityTreeB = ttk.Treeview(root, columns="Name", show="headings", height=13)
identityTreeB.column("Name", width=500)
identityTreeB.grid(row=2, column=2)

selectSkillFrameA = tk.LabelFrame(root, text="Select Skill", borderwidth=5)
selectSkillFrameA.grid(row=8)
selectSkillFrameB = tk.LabelFrame(root, text="Select Skill", borderwidth=5)
selectSkillFrameB.grid(row=8, column=2)

coinTreeA = ttk.Treeview(root, columns=("Base","Coins","Power"), show="headings", height=1)
coinTreeA.heading("Base", text="Base Power")
coinTreeA.heading("Coins", text="# of Coins")
coinTreeA.heading("Power", text="Coin Power")
coinTreeA.column("Base", width=80)
coinTreeA.column("Coins", width=80)
coinTreeA.column("Power", width=80)
coinTreeA.grid(row=16, column=0)
chanceTreeA = ttk.Treeview(root, columns=("Max","Chance"), show="headings", height=1)
chanceTreeA.heading("Max", text="Max Power")
chanceTreeA.heading("Chance", text="Chance of Max")
chanceTreeA.column("Max", width=120)
chanceTreeA.column("Chance", width=120)
chanceTreeA.grid(row=18, column=0)
coinTreeB = ttk.Treeview(root, columns=("Base","Coins","Power"), show="headings", height=1)
coinTreeB.heading("Base", text="Base Power")
coinTreeB.heading("Coins", text="# of Coins")
coinTreeB.heading("Power", text="Coin Power")
coinTreeB.column("Base", width=80)
coinTreeB.column("Coins", width=80)
coinTreeB.column("Power", width=80)
coinTreeB.grid(row=16, column=2)
chanceTreeB = ttk.Treeview(root, columns=("Max","Chance"), show="headings", height=1)
chanceTreeB.heading("Max", text="Max Power")
chanceTreeB.heading("Chance", text="Chance of Max")
chanceTreeB.column("Max", width=120)
chanceTreeB.column("Chance", width=120)
chanceTreeB.grid(row=18, column=2)

tk.Button(root,text="Simulate Clash", command=tryClash).grid(row=2, column=1)

tk.Label(selectSkillFrameA, text="Sinner: ", pady=5).grid(row=0, column=0)
tk.Label(selectSkillFrameA, text="Identity: ", pady=5).grid(row=1, column=0)
tk.Label(selectSkillFrameA, text="Skill: ", pady=5).grid(row=2, column=0)
tk.Label(selectSkillFrameA, text="SP (-45~45): ", pady=5).grid(row=3, column=0)
tk.Label(selectSkillFrameB, text="Sinner: ", pady=5).grid(row=0, column=0)
tk.Label(selectSkillFrameB, text="Identity: ", pady=5).grid(row=1, column=0)
tk.Label(selectSkillFrameB, text="Skill: ", pady=5).grid(row=2, column=0)
tk.Label(selectSkillFrameB, text="SP (-45~45): ", pady=5).grid(row=3, column=0)

spInitA = tk.IntVar(value=0)
selectSinnerA = ttk.Combobox(selectSkillFrameA, values=[], state="readonly")
selectSinnerA.grid(row=0,column=1)
selectSinnerA.bind("<<ComboboxSelected>>", onSinnerSelectedA)
selectIdentityA = ttk.Combobox(selectSkillFrameA, values=[], state="readonly")
selectIdentityA.grid(row=1, column=1)
selectIdentityA.bind("<<ComboboxSelected>>", onIdentitySelectedA)
selectSkillA = ttk.Combobox(selectSkillFrameA, values=[], state="readonly")
selectSkillA.grid(row=2, column=1)
selectSkillA.bind("<<ComboboxSelected>>", displayCoinA)
selectSPA = tk.Spinbox(selectSkillFrameA, from_=-45, to=45, textvariable=spInitA, command=onSPChangeA)
selectSPA.grid(row=3, column=1)
spInitB = tk.IntVar(value=0)
selectSinnerB = ttk.Combobox(selectSkillFrameB, values=[], state="readonly")
selectSinnerB.grid(row=0,column=1)
selectSinnerB.bind("<<ComboboxSelected>>", onSinnerSelectedB)
selectIdentityB = ttk.Combobox(selectSkillFrameB, values=[], state="readonly")
selectIdentityB.grid(row=1, column=1)
selectIdentityB.bind("<<ComboboxSelected>>", onIdentitySelectedB)
selectSkillB = ttk.Combobox(selectSkillFrameB, values=[], state="readonly")
selectSkillB.grid(row=2, column=1)
selectSkillB.bind("<<ComboboxSelected>>", displayCoinB)
selectSPB = tk.Spinbox(selectSkillFrameB, from_=-45, to=45, textvariable=spInitB, command=onSPChangeB)
selectSPB.grid(row=3, column=1)

addSkillFrame = tk.LabelFrame(root, text="Add Skill", borderwidth=5)
addSkillFrame.grid(row=24)
tk.Label(addSkillFrame, text="Sinner: ", pady=5).grid(row=0, column=0)
addSinner = ttk.Combobox(addSkillFrame, values=[], state="readonly")
addSinner.grid(row=0,column=1)
addSinner.bind("<<ComboboxSelected>>", onSinnerSelectedAdd)
tk.Label(addSkillFrame, text="Identity: ", pady=5).grid(row=1, column=0)
addIdentity = ttk.Combobox(addSkillFrame, values=[], state="readonly")
addIdentity.grid(row=1, column=1)
tk.Label(addSkillFrame, text="Skill: ", pady=5).grid(row=2, column=0)
addSkill = ttk.Entry(addSkillFrame)
addSkill.grid(row=2, column=1)
tk.Label(addSkillFrame, text="Coin Details: ", pady=5).grid(row=3, column=0)
addBase = tk.Spinbox(addSkillFrame, from_=3, to=15, width=2)
addBase.grid(row=3, column=1, sticky="W")
addCoins = tk.Spinbox(addSkillFrame, from_=1, to=10, width=2)
addCoins.grid(row=3, column=1)
addPower = tk.Spinbox(addSkillFrame, from_=2, to=15, width=2)
addPower.grid(row=3, column=1, sticky="E")
tk.Button(root,text="Add/Update Custom Skill", command=addCustomSkill).grid(row=32, column=0)

deleteSkillFrame = tk.LabelFrame(root, text="Delete Skill", borderwidth=5)
deleteSkillFrame.grid(row=24, column=2)
tk.Label(deleteSkillFrame, text="Sinner: ", pady=5).grid(row=0, column=0)
deleteSinner = ttk.Combobox(deleteSkillFrame, values=[], state="readonly")
deleteSinner.grid(row=0,column=1)
deleteSinner.bind("<<ComboboxSelected>>", onSinnerSelectedDelete)
tk.Label(deleteSkillFrame, text="Identity: ", pady=5).grid(row=1, column=0)
deleteIdentity = ttk.Combobox(deleteSkillFrame, values=[], state="readonly")
deleteIdentity.grid(row=1, column=1)
deleteIdentity.bind("<<ComboboxSelected>>", displayCustomSkills)
tk.Label(deleteSkillFrame, text="Skill: ", pady=5).grid(row=2, column=0)
deleteSkill = ttk.Combobox(deleteSkillFrame, values=[], state="readonly")
deleteSkill.grid(row=2, column=1)
tk.Button(root,text="Delete Custom Skill", command=deleteCustomSkill).grid(row=32, column=2)

tk.Button(root,text="Export Below to CSV", command=exportTree).grid(row=0, column=2)

def showMain():
    global sinnerList
    sinnerList = BLL.limbusBLL.getSinners()
    selectSinnerA['values'] = sinnerList
    selectSinnerB['values'] = sinnerList
    addSinner['values'] = sinnerList
    deleteSinner['values'] = sinnerList
    displaySinnersA()
    displaySinnersB()

def main():
    root.mainloop()

if __name__ == '__main__':
    main()