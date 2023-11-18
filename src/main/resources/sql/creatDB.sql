-- ----------------------------
-- Table structure for Accounts
-- ----------------------------
CREATE TABLE Accounts (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Account_num VARCHAR(255),
    Account_type ENUM('储蓄', '定期', '投资'),
    Account_balance DECIMAL(15, 2),
    Account_tradeCap DECIMAL(15, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

-- ----------------------------
-- Table structure for Transactions
-- ----------------------------
CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    Transaction_type ENUM('存款', '取款', '转账', '投资'),
    Transaction_amount DECIMAL(15, 2),
    Transaction_time DATETIME,
    Transfer_Account_ID INT,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

-- ----------------------------
-- Table structure for Users
-- ----------------------------
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    User_name VARCHAR(255),
    User_pwd VARCHAR(255),
    User_SignUpTime DATETIME,
    User_gender ENUM('男', '女', '其他'),
    User_age INT,
    User_IDCard VARCHAR(255),
    User_contact VARCHAR(255),
    User_freeze BOOLEAN
) ENGINE = InnoDB AUTO_INCREMENT = 1;

-- ----------------------------
-- Table structure for RiskAssessments
-- ----------------------------
CREATE TABLE RiskAssessments (
    RiskAssessmentsID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    Trade_frequency INT,
    Trade_total_amount DECIMAL(15, 2),
    Trade_avg_amount DECIMAL(15, 2),
    Account_balance DECIMAL(15, 2),
    Risk_Score INT,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

-- ----------------------------
-- Table structure for OperationLog
-- ----------------------------
CREATE TABLE OperationLog (
    OperationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    IpAddress VARCHAR(255),
    Operation VARCHAR(255),
    Operation_url VARCHAR(255),
    Operation_time DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

-- ----------------------------
-- Table structure for HistorySearch
-- ----------------------------
CREATE TABLE HistorySearch (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    User_SearchInput VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

