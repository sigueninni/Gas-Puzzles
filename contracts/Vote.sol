// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.15;

contract Vote {
    struct Voter {
        uint8 vote; //1 byte
        bool voted; // 1 byte
    }

    struct Proposal {
        uint8 voteCount; // 1 byte
        bytes32 name; // 32 bytes
        bool ended; // 1 byte
    }

    mapping(address => Voter) public voters;

    Proposal[] proposals;

    function createProposal(bytes32 _name) external {
        proposals.push(Proposal({voteCount: 0, name: _name, ended: false}));
    }

    function vote(uint8 _proposal) external {
        require(!voters[msg.sender].voted, 'already voted');
        voters[msg.sender].vote = _proposal;
        voters[msg.sender].voted = true;

        proposals[_proposal].voteCount += 1;
    }

    function getVoteCount(uint8 _proposal) external view returns (uint8) {
        return proposals[_proposal].voteCount;
    }
}

/* 1  
           Current gas use:   138807
           The gas target is: 136508
           You are 2299 above the target

           */
