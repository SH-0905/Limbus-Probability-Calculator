import DAL
import random
import csv
from decimal import Decimal

class limbusBLL:
    def login(username, password):
        try:
            DAL.limbusDAL.databaseLogin(username, password)
            return True
        except Exception:
            return False

    def findHigher(num1, num2):
        if num1 > num2:
            return num1
        else:
            return num2

    def getSinners():
        return DAL.limbusDAL.getSinners()

    def getIdentities(sinner):
        return DAL.limbusDAL.getIdentities(sinner)

    def getSkills(sinner, identity):
        return DAL.limbusDAL.getSkills(sinner, identity)
    def getCustomSkills(sinner, identity):
        return DAL.limbusDAL.getCustomSkills(sinner, identity)

    def getSkillDetails(sinner, identity, skill):
        return DAL.limbusDAL.getCoin(sinner, identity, skill)

    def getBaseChance(sinner, identity, skill):
        return DAL.limbusDAL.getBaseChance(sinner, identity, skill)

    def getNewChance(sinner, identity, skill, SP):
        coinDetail = DAL.limbusDAL.getCoin(sinner, identity, skill)
        modChance = Decimal(0.5)+(SP/100)
        coinNumber = coinDetail[0].coinNumber
        newChance = (modChance)**coinNumber
        return newChance*100

    def addUpdateSkill(sinner, identity, skillName, base, coins, power):
        customSkill = DAL.Skill_Object(sinner, identity, 4, skillName, 'White', base, coins, power)
        result = DAL.limbusDAL.addCustomSkill(customSkill)
        if result == -1:
            DAL.limbusDAL.updateCustomSkill(customSkill)
            return f"Updated skill {customSkill.skillName} successfully"
        return f"Added skill {customSkill.skillName} successfully"

    def deleteSkill(sinner, identity):
        customSkill = DAL.Skill_Object(sinner, identity, 4, 'skillName', 'White', 0,0,0)
        result = DAL.limbusDAL.deleteCustomSkill(customSkill)
        if result == -1:
            raise Exception(f"No custom skill exists for {customSkill.identity} {customSkill.sinner}")
        return f"Deleted skill {customSkill.skillName} successfully"

    def simClash(baseA, coinsA, coinPowA, SPA, baseB, coinsB, coinPowB, SPB):
        chanceA = (Decimal(0.5)) + (SPA/100)
        chanceB = (Decimal(0.5)) + (SPB/100)
        clashesA, clashesB = 0, 0
        for x in range(20):
            for coins in range(coinsA):
                finalA = 0
                rand = Decimal(str(random.uniform(0, 1)))
                if rand < chanceA:
                    finalA = baseA + coinPowA
            for coins in range(coinsB):
                finalB = 0
                rand = Decimal(str(random.uniform(0, 1)))
                if rand < chanceB:
                    finalB = baseB + coinPowB
            if finalA > finalB:
                clashesA += 1
            elif finalA < finalB:
                clashesB += 1
        if clashesA > clashesB:
            return 1
        elif clashesB > clashesA:
            return 2
        else:
            return 3

    def exportCSV(columns, rows, path):
        with open(path, "w", newline='', encoding="utf-8-sig") as file:
            write = csv.writer(file)
            write.writerow(columns)
            write.writerows(rows)