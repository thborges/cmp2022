
#pragma once

// header.h

enum noh_type {PROGRAM,
	ASSIGN, SUM, MINUS, MULTI,
	DIVIDE, PRINT, POW};

struct noh {
	int id;
	enum noh_type type;
	int childcount;

	struct noh *children[1];
};
typedef struct noh noh;

noh *create_noh(enum noh_type, int children);


