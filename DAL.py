import mysql.connector

class Coin_Object:
    def __init__(self, basePower, coinNumber, coinPower):
        self.basePower = basePower
        self.coinNumber = coinNumber
        self.coinPower = coinPower
    def __str__(self):
        return f"{self.basePower} {self.coinNumber} {self.coinPower} "

class Skill_Object:
    def __init__(self, sinner, identity, skillNum, skillName, skillColor, base, coins, power):
        self.sinner = sinner
        self.identity = identity
        self.skillNum = skillNum
        self.skillName = skillName
        self.skillColor = skillColor
        self.base = base
        self.coins = coins
        self.power = power
    def __str__(self):
        return f"{self.sinner} {self.identity} {self.skillNum} {self.skillName} {self.skillColor} {self.base} {self.coins} {self.power}"

class limbusDAL:
    connection = None
    def databaseLogin(user,password):
        limbusDAL.connection = mysql.connector.connect(
            host="localhost",
            user=user,
            password=password,
            database="limbus"
        )
    def getSinners():
        cacheList = []
        mydb = limbusDAL.connection
        cursor = mydb.cursor()
        cursor.callproc("getSinnerList")
        for x in cursor.stored_results():
            for y in x.fetchall():
                cacheList.append(y[0])
        cursor.close()
        return cacheList

    def getIdentities(sinner):
        cacheList = []
        mydb = limbusDAL.connection
        cursor = mydb.cursor()
        cursor.callproc("getIdentityList", (sinner,))
        for x in cursor.stored_results():
            for y in x.fetchall():
                cacheList.append(y[0])
        cursor.close()
        return cacheList

    def getSkills(sinner, identity):
        cacheList = []
        mydb = limbusDAL.connection
        cursor = mydb.cursor()
        cursor.callproc("getSkillList", (sinner, identity))
        for x in cursor.stored_results():
            for y in x.fetchall():
                cacheList.append(y[0])
        cursor.close()
        return cacheList

    def getCustomSkills(sinner, identity):
        cacheList = []
        mydb = limbusDAL.connection
        cursor = mydb.cursor()
        cursor.callproc("getCustomSkillList", (sinner, identity))
        for x in cursor.stored_results():
            for y in x.fetchall():
                cacheList.append(y[0])
        cursor.close()
        return cacheList

    def getCoin(sinner, identity, skill):
        cacheList = []
        mydb = limbusDAL.connection
        cursor = mydb.cursor()
        cursor.callproc("getCoinDetails", (sinner,identity,skill))
        for x in cursor.stored_results():
            for y in x.fetchall():
                cacheList.append(Coin_Object(y[0],y[1],y[2]))
        cursor.close()
        return cacheList

    def getBaseChance(sinner, identity, skill):
        cacheList = []
        mydb = limbusDAL.connection
        cursor = mydb.cursor()
        cursor.callproc("getBaseChance", (sinner,identity,skill))
        for x in cursor.stored_results():
            for y in x.fetchall():
                cacheList.append(y[0])
        cursor.close()
        return cacheList

    def addCustomSkill(object):
        result = None
        mydb = limbusDAL.connection
        cursor = mydb.cursor()
        arg = (object.sinner, object.identity, object.skillNum, object.skillName, object.skillColor, object.base, object.coins, object.power)
        cursor.callproc("addSkill", arg)
        mydb.commit()
        for x in cursor.stored_results():
            for y in x.fetchall():
                result = y[0]
        cursor.close()
        return result

    def deleteCustomSkill(object):
        result = None
        mydb = limbusDAL.connection
        cursor = mydb.cursor()
        arg = (object.sinner, object.identity, object.skillNum)
        cursor.callproc("deleteSkill", arg)
        mydb.commit()
        for x in cursor.stored_results():
            for y in x.fetchall():
                result = y[0]
        cursor.close()
        return result

    def updateCustomSkill(object):
        result = None
        mydb = limbusDAL.connection
        cursor = mydb.cursor()
        arg = (object.sinner, object.identity, object.skillNum, object.skillName, object.skillColor, object.base, object.coins, object.power)
        cursor.callproc("updateSkill", arg)
        mydb.commit()
        for x in cursor.stored_results():
            for y in x.fetchall():
                result = y[0]
        cursor.close()
        return result

