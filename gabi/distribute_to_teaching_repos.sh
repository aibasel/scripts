#! /bin/bash

for repo in $(cat list)
    do echo $repo
    hg clone ssh://ai-repos/$repo
    reponame=${repo##*/}
    DIFF=$(diff beamerthemeAI.sty $reponame/slides/beamerthemeAI.sty)
    ok=$?
    if [ "$DIFF" != "" ] 
    then
        echo "modified beamerthemeAI in $reponame"
        ok=1
    fi
    DIFF=$(diff beamercolorthemeAI.sty $reponame/slides/beamercolorthemeAI.sty)
    if [ "$DIFF" != "" ] 
    then
        echo "modified beamercolorthemeAI in $reponame"
        ok=1
    fi
    if [ ${ok} -eq 0 ]
    then
        cp newbeamercolorthemeAI.sty $reponame/slides/beamercolorthemeAI.sty
        cp newbeamerthemeAI.sty $reponame/slides/beamerthemeAI.sty
        cp beamerboxesframed.sty $reponame/slides/
        cd $reponame
        hg add slides/beamerboxesframed.sty
        hg commit -m "beamer: frames around boxes in handout slides"
        hg push
        cd ..
    else
        echo "did not update $reponame"
    fi
done
