// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.15;

contract OptimizedVote {
    struct Voter {
        uint8 vote;
        bool voted;
    }

    struct Proposal {
        uint8 voteCount;
        bool ended;
        bytes32 name;
    }

    mapping(uint8 => Proposal) public proposals;
    uint8 private counter;

    mapping(address => Voter) public voters;

    //Proposal[] proposals;

    function createProposal(bytes32 _name) external {
        //  proposals.push(Proposal({voteCount: 0, name: _name, ended: false}));
        proposals[counter] = Proposal(0, false, _name);
        ++counter;
    }

    function vote(uint8 _proposal) external {
        require(voters[msg.sender].voted == false, 'already voted');
        voters[msg.sender].vote = _proposal;
        voters[msg.sender].voted = true;

        proposals[_proposal].voteCount += 1;
    }

    function getVoteCount(uint8 _proposal) external view returns (uint8 count) {
        return proposals[_proposal].voteCount;
    }
}

/*     Gas target
           Current gas use:   138807
           The gas target is: 136508
           You are 2299 above the target
           */

// changing array by mapping and packing struct
