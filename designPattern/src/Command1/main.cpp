#include <QCoreApplication>
#include<iostream>

//要指针


//接收者
class Receiver{
public:
    void action(){
        std::cout<<"Receiver execute the action."<<std::endl;
    }
};

//抽象命令类
class Command{
protected:
    Receiver* receiver;

public:
    Command(Receiver* receiver_){
        receiver=receiver_;
    }
    virtual void execute()=0;
};

//具体命令类
class ConctreteCommand:public Command{
public:
    ConctreteCommand(Receiver* receiver):Command(receiver){
    }
    ~ConctreteCommand(){
    }

    void execute(){
        receiver->action();
    }
};


//客户端调用类
class Invoker{

private:
    Command* command;

public:
    Invoker(){}
    ~Invoker(){}
    void setCommand(Command* command_){
        command=command_;
    }

    void executeCommand(){
        command->execute();
    }
};


int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    Receiver *r=new Receiver();
    Command *c=new ConctreteCommand(r);
    Invoker *i=new Invoker();
    i->setCommand(c);
    i->executeCommand();

    return a.exec();
}
