BEGIN
{
    globalIndex = 0;
}

proc:::lwp-start
/pid == $target/
{
    this->mIndex = ++globalIndex;
    printf("[%d] thread start, count = %d", this->mIndex, curpsinfo->pr_nlwp);
}

proc:::lwp-exit
/pid == $target/
{
    this->mIndex = ++globalIndex;
    printf("[%d] thread exit, count = %d", this->mIndex, curpsinfo->pr_nlwp);
}