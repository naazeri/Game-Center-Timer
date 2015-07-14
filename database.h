#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QTimer>
#include <QTime>

class DataBase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int payment READ payment WRITE setPayment NOTIFY paymentChanged)

public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();
    void initData();
    int payment();
    void setPayment(int payment);

private:
    bool isSp;
    int thePayment;
    qint64 spentTime;
    float spPerSec, mpPerSec;
    QTime *time;
    QTimer *timer;

signals:
    void paymentChanged();

public slots:
    void start();
    void pause();
    void stop();
    void spActivated();
    void mpActivated();

};

#endif // DATABASE_H
